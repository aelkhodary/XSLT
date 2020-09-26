<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:f="http://localhost/functions"
  exclude-result-prefixes="xs f">

   <!-- Examples for Chapter 9, section "Associativity of the binary '/' operator" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
    <output>
      <example-one>
        <xsl:variable name="data">
          <a>
            <A/>
            <A/>
          </a>
        </xsl:variable>
        <xsl:variable name="A" select="$data/a/A"/>
        <one><xsl:value-of select="count($A/../f:create-B())"/></one>
        <two><xsl:value-of select="count($A/(../f:create-B()))"/></two>
      </example-one>
      <example-two>
        <xsl:variable name="data">
          <A>
            <B><C/></B>
          </A>
          <A>
            <B><C/></B>
          </A>          
        </xsl:variable>
        <xsl:variable name="S" as="element()*">
          <Z/>
          <Z/>
          <Z/>
        </xsl:variable>
        <one><xsl:value-of select="count($data/A/B/remove($S, position()))"/></one>
        <two><xsl:value-of select="count($data/A/(B/remove($S, position())))"/></two>
      </example-two>     
      <example-three>
        <xsl:variable name="data">
          <data>
            <A/>
            <A/>
            <A/>
          </data>
        </xsl:variable>
        <xsl:for-each select="$data/data">
          <one><xsl:value-of select="A/../name()"/></one>
          <two><xsl:value-of select="A/(../name())"/></two>
        </xsl:for-each>  
      </example-three>              
    </output>
</xsl:template>

<xsl:function name="f:create-B">
  <B/>
</xsl:function>

</xsl:stylesheet>                                