<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 8, section "General Comparisons" -->
   <!-- These examples assume use of a schema-aware processor -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
  <xsl:for-each select="$data/data">
    <output>
      <eg><xsl:value-of select="@width  = 3"/></eg>
      <eg><xsl:value-of select="@width = (10, 20, 30)"/></eg>        
      <eg><xsl:value-of select="@width != $x"/></eg>
      <eg><xsl:value-of select="count(*) > 10"/></eg>
      <eg><xsl:value-of select="sum(SALES) &lt; 10000"/></eg>
      <eg><xsl:value-of select="position() &lt; last() div 2"/></eg>
      <eg><xsl:value-of select="not(//@temp &lt;= 0.0)"/></eg>      
    </output>
  </xsl:for-each>    
</xsl:template>

<xsl:variable name="x" select="2.5"/>
<xsl:variable name="y" select="1 to 5"/>
<xsl:variable name="data">
  <data type="xs:anyType">
    <xsl:attribute name="width" select="30" type="xs:integer"/>
    <SALES>5000</SALES>
  </data>
  <data type="xs:anyType" temp="-1">
    <xsl:attribute name="width" select="15" type="xs:integer"/>
    <SALES>6000</SALES>
    <SALES>8000</SALES>
  </data>  
</xsl:variable> 

</xsl:stylesheet>                                