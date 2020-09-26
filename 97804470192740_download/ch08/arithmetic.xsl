<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

   <!-- Examples for Chapter 8, section "Numeric Arithmetic" -->
   
<xsl:output indent="yes"/>   

<xsl:template match="sales">
  <output>
    <eg><xsl:value-of select="$X + 1"/></eg>
    <eg><xsl:value-of select="last()-1"/></eg>
    <eg><xsl:value-of select="@margin*2"/></eg>
    <eg><xsl:value-of select="ceiling(count(item) div 3)"/></eg>
    <eg><xsl:value-of select="$seq[position() le last() idiv 2]"/></eg>
    <eg><xsl:value-of select="item[position() mod 2 = 0]"/></eg>
    <eg><xsl:value-of select="count($list) mod 5 + 1"/></eg>
    <eg><xsl:value-of select="-@credit"/></eg>
    <eg><xsl:value-of select="+@credit"/></eg>
    <eg><xsl:value-of select="1---1"/></eg>    
  </output>
  
</xsl:template>

<xsl:variable name="area" as="element()">
<area x="22">
  <sales value="120.00" margin="30.00" credit="80.00">
    <item>jam</item>
    <item>marmalade</item>
    <item>chutney</item>
    <item>honey</item>
  </sales>  
  <sales value="80.00" credit="-10.00"/>
</area>
</xsl:variable>

<xsl:variable name="X" select="42"/>
<xsl:variable name="seq" select="$area//item"/>
<xsl:variable name="list" select="$area//item"/>

<xsl:template name="main">
  <xsl:apply-templates select="$area/sales"/>
</xsl:template>

</xsl:stylesheet>                                