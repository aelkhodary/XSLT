<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: max(), min() --> 
   
   <xsl:output method="xml" indent="yes" encoding="utf-8"/>
   
   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="max((10, 20, xs:float(-5), 13))"/></ex>
     <ex><xsl:value-of select="max(('a', 'x', 'b'))"/></ex>
     <ex><xsl:value-of select="max(2)"/></ex>
     <ex><xsl:value-of select="max(())"/></ex>
     <ex><xsl:value-of select="min((xs:dayTimeDuration('PT10S'), xs:dayTimeDuration('PT1M')))"/></ex>
     <ex><xsl:value-of select="min((xs:date('2000-01-01'), current-date()))"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>