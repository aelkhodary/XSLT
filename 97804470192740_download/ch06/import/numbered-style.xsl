<xsl:stylesheet version="2.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="standard-style.xsl"/>

<xsl:template match="line">
   <xsl:number level="any" format="001"/>&#xa0;&#xa0;
   <xsl:apply-imports/>
</xsl:template>

</xsl:stylesheet>

