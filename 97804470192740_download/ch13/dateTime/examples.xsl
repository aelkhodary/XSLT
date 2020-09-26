<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: dateTime --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="dateTime(xs:date('2008-01-01'), xs:time('12:00:00'))"/></ex>
     <ex><xsl:value-of select="dateTime(xs:date('2008-01-01'), xs:time('12:00:00Z'))"/></ex>
     <ex><xsl:value-of select="dateTime(xs:date('2008-01-01Z'), xs:time('12:00:00Z'))"/></ex>
     <!-- following line commented out because it throws an error
       <ex><xsl:value-of select="dateTime(xs:date('2008-01-01+02:00'), xs:time('12:00:00Z'))"/></ex>
     -->  
     <ex><xsl:value-of select="dateTime(xs:date('2008-01-01+02:00'), xs:time('24:00:00'))"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>