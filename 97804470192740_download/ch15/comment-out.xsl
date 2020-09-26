<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY start-comment "&#xE501;">
  <!ENTITY end-comment "&#xE502;">
]>

<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output use-character-maps="comment-delimiters"/>

<xsl:character-map name="comment-delimiters">
  <xsl:output-character character="&start-comment;" string="&lt;!--"/>
  <xsl:output-character character="&end-comment;" string="--&gt;"/>
</xsl:character-map>

<xsl:template match="*">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="*[@delete='yes']">
  <xsl:text>&start-comment;</xsl:text>
  <xsl:copy-of select="."/>
  <xsl:text>&end-comment;</xsl:text>
</xsl:template>

</xsl:stylesheet>

