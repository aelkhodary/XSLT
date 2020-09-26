<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>
<xsl:template match="*">
   <xsl:comment>
      <xsl:value-of select="name()"/>
      <xsl:for-each select="ancestor::*">
         <xsl:sort select="position()" order="descending"/>
         <xsl:text> within </xsl:text>
         <xsl:value-of select="name()"/>
      </xsl:for-each>
   </xsl:comment>
   <xsl:apply-templates/>
</xsl:template>

</xsl:transform>

