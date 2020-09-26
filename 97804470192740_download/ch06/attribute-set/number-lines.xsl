<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>
<xsl:strip-space elements="*"/>
<xsl:output method="xml" indent="yes"/>

<xsl:template match="*">
   <xsl:copy>
     <xsl:apply-templates/>
   </xsl:copy>   
</xsl:template>

<xsl:template match="line">
   <xsl:copy use-attribute-sets="sequence">
     <xsl:apply-templates/>
   </xsl:copy>   
</xsl:template>

<xsl:attribute-set name="sequence">
   <xsl:attribute name="number" select="position()"/>
   <xsl:attribute name="of" select="last()"/>
</xsl:attribute-set>

</xsl:transform>

