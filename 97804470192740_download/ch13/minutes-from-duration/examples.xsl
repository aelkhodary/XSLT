<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: minutes-from-duration --> 
   
   <xsl:output method="xml" indent="yes" encoding="utf-8"/>
   
   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="minutes-from-duration(xs:dayTimeDuration('PT12H20M'))"/></ex>
     <ex><xsl:value-of select="minutes-from-duration(xs:duration('PT210S'))"/></ex>
     <ex><xsl:value-of select="minutes-from-duration(xs:duration('-PT75M'))"/></ex>
     <ex><xsl:value-of select="minutes-from-duration(xs:yearMonthDuration('P1Y'))"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>