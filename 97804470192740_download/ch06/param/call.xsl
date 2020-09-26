<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>
<xsl:output method="text"/>

<xsl:template match="/">
  <xsl:for-each select="//*">
    <xsl:value-of select="concat(name(), ' -- ')"/>
    <xsl:call-template name="depth"/>;
  </xsl:for-each>
</xsl:template>

<xsl:template name="depth">
    <xsl:param name="node" as="node()" select="."/>
    <xsl:value-of select="count($node/ancestor::node())"/>
</xsl:template>
</xsl:transform>

