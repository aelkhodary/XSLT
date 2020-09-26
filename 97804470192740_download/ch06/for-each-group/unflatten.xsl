<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     
<xsl:output method="xml" indent="yes"/>     

<xsl:template match="body">
<xsl:copy>
  <xsl:for-each-group select="*" group-starting-with="h1">
    <xsl:apply-templates select="." mode="group"/>
  </xsl:for-each-group>
</xsl:copy>
</xsl:template>

<xsl:template match="h1" mode="group">
<div><head><xsl:value-of select="."/></head>
  <xsl:for-each-group select="current-group() except ." 
                      group-starting-with="h2">
    <xsl:apply-templates select="." mode="group"/>
  </xsl:for-each-group>
</div>
</xsl:template>

<xsl:template match="h2" mode="group">
<div><head><xsl:value-of select="."/></head>
  <xsl:for-each-group select="current-group() except ." 
                      group-starting-with="h3">
    <xsl:apply-templates select="." mode="group"/>
  </xsl:for-each-group>
</div>
</xsl:template>

<xsl:template match="h3" mode="group">
<div><head><xsl:value-of select="."/></head>
  <xsl:copy-of select="current-group() except ."/>
</div>
</xsl:template>

<xsl:template match="p" mode="group">
  <xsl:copy-of select="current-group()"/>
</xsl:template>


</xsl:stylesheet>

