<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>

<xsl:key name="author-name" match="book" use="author"/>

<xsl:param name="author" required="yes"/>

<xsl:template match="/">
  <xsl:copy-of select="key('author-name', $author)"/>
</xsl:template>

</xsl:transform>


