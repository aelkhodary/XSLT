<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>
<xsl:template match="/">
  <html><body>
    <xsl:for-each select="//book">
       <h1><xsl:value-of select="title"/></h1>
       <p>Category: <xsl:value-of
                      select="$categories[@code=current()/@category]/@desc"/>
       </p>
    </xsl:for-each>
  </body></html>
</xsl:template>
<xsl:variable name="categories" as="element(category)*">
  <category code="S" desc="Science"/>
  <category code="CS" desc="Computing"/>
  <category code="FC" desc="Children's Fiction"/>
</xsl:variable>  
</xsl:transform>
