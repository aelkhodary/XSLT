<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>

<xsl:template match="/">
  <html>
  <head><title><xsl:value-of select="static-base-uri()"/></title></head>
  <body>
    <h1>Stylesheet Module Structure</h1>
    <p><xsl:value-of select="static-base-uri()"/></p>
    <ul>
    <xsl:apply-templates select="*/xsl:include | */xsl:import"/>
    </ul>
  </body></html>
</xsl:template>

<xsl:template match="xsl:include | xsl:import">
    <li><xsl:value-of select="concat(local-name(),'s ',@href)"/>
    <xsl:variable name="module" select="document(@href)"/>
    <ul>
    <xsl:apply-templates 
        select="$module/*/xsl:include | $module/*/xsl:import"/>
    </ul>
    </li>
</xsl:template>

</xsl:transform>

