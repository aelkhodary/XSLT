<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 8, section "Value Comparisons" -->
   <!-- These examples assume use of a schema-aware processor -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
  <xsl:for-each select="$data/data">
    <output>
      <eg><xsl:value-of select="$x eq 2"/></eg>
      <eg><xsl:value-of select="count($y) gt 2"/></eg>        
      <eg><xsl:value-of select="@x eq 'yes'"/></eg>
      <eg><xsl:value-of select="@retirement-date ge current-date()"/></eg>
    </output>
  </xsl:for-each>    
</xsl:template>

<xsl:variable name="x" select="2.5"/>
<xsl:variable name="y" select="1 to 5"/>
<xsl:variable name="data" as="element()">
  <data x="no" type="xs:anyType">
    <xsl:attribute name="retirement-date" select="'2008-06-01'" type="xs:date"/>
  </data>
</xsl:variable> 

</xsl:stylesheet>                                