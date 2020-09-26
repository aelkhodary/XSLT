<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Example for xsl:apply-imports: a.xsl -->
  
<xsl:template match="date"> 
   <xsl:value-of select="day"/>
   <xsl:text>/</xsl:text>
   <xsl:value-of select="month"/>
   <xsl:text>/</xsl:text>
   <xsl:value-of select="year"/>
</xsl:template>


</xsl:transform>
    