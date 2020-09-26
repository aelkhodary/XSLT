<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="1.0"
 xmlns:book="http://ns.wrox.com/books.uri"
 exclude-result-prefixes="book"
>
<xsl:template match="/">
  <html><body>
    <xsl:for-each select="//book">
       <h1><xsl:value-of select="title"/></h1>
       <p>Category: <xsl:value-of
                      select="document('')/*/book:category
                      [@code=current()/@category]/@desc"/>
       </p>
    </xsl:for-each>
  </body></html>
</xsl:template>
<book:category code="S" desc="Science"/>
<book:category code="CS" desc="Computing"/>
<book:category code="FC" desc="Children's Fiction"/>
</xsl:transform>
