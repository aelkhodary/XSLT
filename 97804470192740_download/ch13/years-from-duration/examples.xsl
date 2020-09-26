<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: year-from-date --> 
   
   <xsl:output method="xml" indent="yes" encoding="utf-8"/>
   
   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="years-from-duration(xs:yearMonthDuration('P1200Y'))"/></ex>
     <ex><xsl:value-of select="years-from-duration(xs:duration('P18M'))"/></ex>
     <ex><xsl:value-of select="years-from-duration(xs:duration('-P3Y6M'))"/></ex>
     <ex><xsl:value-of select="years-from-duration(xs:dayTimeDuration('P8000D'))"/></ex>
   </out>                      
   </xsl:template>
   
   

</xsl:stylesheet>