<?xml version='1.0'?><xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:f="http://www.wrox.com/xslt-errata"
   xpath-default-namespace="http://www.w3.org/1999/xhtml">

<xsl:param name="spec" as="document-node()" 
           select="doc('http://www.w3.org/TR/xslt20')"/>
<xsl:param name="phrase" as="xs:string" required="yes"/>

<xsl:template name="main">
  <html>
    <head>
      <title>XSLT 2.0 Specification Search</title>
    </head>
    <body>
      <h1>XSLT 2.0 Specification Search</h1>
      <xsl:variable name="matches" select="$spec//text()[contains(.,$phrase)]"/>
      <xsl:choose>
        <xsl:when test="$matches">
          <h2>Matches for "<xsl:value-of select="$phrase"/>"</h2>
          <xsl:for-each select="$matches">
            <xsl:variable name="div" select="ancestor::div[(h1|h2|h3|h4)/a][1]"/>
            <h3>
              <a href="http://www.w3.org/TR/xslt20#{$div/(h1|h2|h3|h4)/a/@id}">
                <xsl:value-of select="$div/(h1|h2|h3|h4)"/>
              </a>
            </h3>  
            <p>See <xsl:value-of select="f:location($div, ..)"/>:</p>
            <xsl:copy-of select="ancestor::p[1]"/>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <h2>No matches found</h2>
        </xsl:otherwise>
      </xsl:choose>
    </body>
  </html>        
</xsl:template>

<xsl:function name="f:location" as="xs:string">
   <xsl:param name="section" as="element()"/>
   <xsl:param name="subsection" as="element()"/>
   <xsl:choose>
     <xsl:when test="count($subsection/../*) = 1 or $subsection[self::span|self::a]">
       <xsl:value-of select="f:location($section, $subsection/..)"/>
	   </xsl:when>
     <xsl:when test="$subsection/.. is $section">
	   <xsl:value-of>
	     <xsl:number select="$subsection" format="w" ordinal="yes"/>
	     <xsl:text> </xsl:text>
	     <xsl:apply-templates select="$subsection" mode="user-element-name"/>
	   </xsl:value-of>
	 </xsl:when>
	 <xsl:otherwise>
	   <xsl:value-of>
	     <xsl:value-of select="f:location($section, $subsection/..)"/>
		   <xsl:text>, </xsl:text>
		   <xsl:number select="$subsection" format="w" ordinal="yes"/>
		   <xsl:text> </xsl:text>
		   <xsl:apply-templates select="$subsection" mode="user-element-name"/>
	   </xsl:value-of>
	 </xsl:otherwise>
   </xsl:choose>
</xsl:function>


<xsl:template match="*" mode="user-element-name">
  <xsl:value-of select="name(.)"/>
</xsl:template>

<xsl:template match="p" mode="user-element-name">paragraph</xsl:template>
<xsl:template match="ul" mode="user-element-name">bulleted list</xsl:template>
<xsl:template match="ol" mode="user-element-name">numbered list</xsl:template>
<xsl:template match="li" mode="user-element-name">list item</xsl:template>
<xsl:template match="eg" mode="user-element-name">code section</xsl:template>
<xsl:template match="div[@class='example']" mode="user-element-name">example box</xsl:template>
<xsl:template match="div[@class='note']" mode="user-element-name">Note</xsl:template>
<xsl:template match="example[@role='signature']" mode="user-element-name">function signature</xsl:template>
<xsl:template match="tbody" mode="user-element-name">table body</xsl:template>
<xsl:template match="tr" mode="user-element-name">row</xsl:template>
<xsl:template match="td" mode="user-element-name">column</xsl:template>

</xsl:stylesheet>