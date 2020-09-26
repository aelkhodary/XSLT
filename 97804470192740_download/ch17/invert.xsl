<xsl:stylesheet 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="2.0">

<xsl:template match="SCENE">
   <xsl:variable name="flat">
      <NL/>
      <xsl:apply-templates mode="phase1"/>
   </xsl:variable>
   <xsl:apply-templates select="$flat/NL[following-sibling::node()]" mode="phase2"/>
</xsl:template>   
   
<xsl:template match="SPEECH" mode="phase1">
   <speaker><xsl:value-of select="SPEAKER"/></speaker>
   <xsl:copy-of select="node() except SPEAKER"/>
</xsl:template>

<xsl:template match="NL" mode="phase2">
  <line>
    <xsl:apply-templates 
      select="following-sibling::node()[1][not(self::NL)]" mode="phase2"/>
  </line>
</xsl:template>

<xsl:template match="node()" mode="phase2">
  <xsl:copy-of select="."/>
  <xsl:apply-templates 
     select="following-sibling::node()[1][not(self::NL)]" mode="phase2"/>
</xsl:template>
</xsl:stylesheet>

