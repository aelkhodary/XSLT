<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

   <!-- Examples for Chapter 7, section "Conditional Expressions" -->
   

<xsl:output indent="yes"/>   

<xsl:template match="area">
  <output>
    <eg><xsl:value-of select="if (@x) then @x else 0"/></eg>
    <eg><xsl:value-of select="if ($area/sales) then avg($area/sales/@value) else number('NaN')"/></eg> 
    <eg><xsl:value-of select="if (normalize-space(.)) then string(.) else ()"/></eg>  
  </output>
</xsl:template>

<xsl:variable name="area" as="element()">
<area x="22">
  <sales value="120.00"/>
  <sales value="80.00"/>
  text
</area>
</xsl:variable>

<xsl:template name="main">
  <xsl:apply-templates select="$area"/>
</xsl:template>

</xsl:stylesheet>                                