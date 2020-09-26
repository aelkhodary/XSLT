<xsl:stylesheet version="2.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="attributes.xsl"/>

<xsl:template match="/" name="main">
   <picture xsl:use-attribute-sets="picture-attributes">
      <xsl:attribute name="color">red</xsl:attribute>
   </picture>
</xsl:template>

</xsl:stylesheet>

