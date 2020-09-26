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
     <ex><xsl:value-of select="year-from-date(xs:date('2008-02-28'))"/></ex>
     <ex><xsl:value-of select="year-from-dateTime(xs:dateTime('1969-07-20T16:17:00-04:00'))"/></ex>
   </out>                      
   </xsl:template>
   
   

</xsl:stylesheet>