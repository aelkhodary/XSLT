<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 8, section "Duration Arithmetic" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
  <output>
    <eg><xsl:value-of select="xs:dayTimeDuration('P10D') div xs:dayTimeDuration('PT6H') "/></eg>
    <eg><xsl:value-of select="xs:dayTimeDuration('-P1D') div xs:dayTimeDuration('PT1S')"/></eg>
    <eg><xsl:value-of select="xs:yearMonthDuration('P1M') div xs:yearMonthDuration('P1Y')"/></eg>
  </output>  
</xsl:template>

</xsl:stylesheet>                                