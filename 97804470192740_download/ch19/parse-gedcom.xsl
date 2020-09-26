<xsl:transform version="2.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" 
   exclude-result-prefixes="xs">
   
<!-- Parse a GEDCOM 5.0 file --> 

<xsl:output method="xml" indent="yes"/>

<!-- The $input parameter holds the name of the input GEDCOM file, relative to the stylesheet -->

<xsl:param name="input" as="xs:string" required="yes"/> 

<!-- Read the input file into a string variable -->

<xsl:variable name="input-text" as="xs:string" 
                     select="unparsed-text($input, 'iso-8859-1')"/>

<!-- Split the input file into a sequence of strings, each holding one line of the input -->

<xsl:variable name="lines" as="xs:string*" select="tokenize($input-text, '\r?\n')"/>

<!-- Parse each line of the input file, creating a sequence of <line> elements with attributes representing
      the various fields of the GEDCOM input -->

<xsl:variable name="parsed-lines" as="element(line)*">
  <xsl:for-each select="$lines">
    <xsl:analyze-string select="." flags="x"
                        regex="^([0-9]+)\s*
                               (@([A-Za-z0-9]+)@)?\s*
                               ([A-Za-z]*)?\s*
                               (@([A-Za-z0-9]+)@)?
                               (.*)$"> 
      <xsl:matching-substring>
        <line level="{regex-group(1)}"
              ID="{regex-group(3)}"
              tag="{regex-group(4)}"
              REF="{regex-group(6)}"
              text="{regex-group(7)}"/>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:message>Non-matching line "<xsl:value-of select="."/>"</xsl:message>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:for-each>
</xsl:variable>

<!-- Process one level of the GEDCOM input, identified by its level number. The template
      calls itself recursively to process deeper levels. The effect is to turn a flat structure in which
      records are identified by level number, into a nested structure in which elements at each level
      contain the elements at deeper levels -->

<xsl:template name="process-level">
  <xsl:param name="population" required="yes" as="element()*"/>
  <xsl:param name="level" required="yes" as="xs:integer"/>
  <xsl:for-each-group select="$population" 
                                  group-starting-with="*[xs:integer(@level) eq $level]">
    <xsl:element name="{@tag}">
      <xsl:copy-of select="@ID[string(.)], @REF[string(.)]"/>
      <xsl:value-of select="normalize-space(@text)"/>
      <xsl:call-template name="process-level">
        <xsl:with-param name="population" select="current-group()[position() != 1]"/>
        <xsl:with-param name="level" select="$level + 1"/>
      </xsl:call-template>
    </xsl:element>
  </xsl:for-each-group>
</xsl:template>

<!-- Create the hierarchic representation of the original GEDCOM structure,
      by calling the recursive template to process level zero -->

<xsl:variable name="nested">
<GED>
  <xsl:call-template name="process-level">
    <xsl:with-param name="population" select="$parsed-lines"/>
    <xsl:with-param name="level" select="0"/>
  </xsl:call-template>
</GED>
</xsl:variable>

<!-- Main entry point to the stylesheet -->
<!-- The match="/" allows the stylesheet to be run with a dummy input document, for example in Altova -->

<xsl:template name="main" match="/">
   <xsl:copy-of select="$nested"/>
</xsl:template>

<!-- Secondary entry point, used for debugging, to show the intermediate results -->

<xsl:template name="debug">
   <xsl:copy-of select="$parsed-lines"/>
</xsl:template>

</xsl:transform>
