<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: hours-from-duration --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="hours-from-duration(xs:dayTimeDuration('P5DT12H30M'))"/></ex>
     <ex><xsl:value-of select="hours-from-duration(xs:dayTimeDuration('PT72H'))"/></ex>
     <ex><xsl:value-of select="hours-from-duration(xs:duration('-PT36H15M'))"/></ex>
     <ex><xsl:value-of select="hours-from-duration(xs:yearMonthDuration('P12M'))"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>