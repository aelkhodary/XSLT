<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: minutes-from-time --> 
   
   <xsl:output method="xml" indent="yes" encoding="utf-8"/>
   
   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="minutes-from-time(xs:time('12:35:03.142'))"/></ex>
     <ex><xsl:value-of select="minutes-from-dateTime(xs:dateTime('2008-02-28T13:55:30'))"/></ex>
     <ex><xsl:value-of select="minutes-from-time(xs:time('00:30:02+01:00'))"/></ex>
     <ex><xsl:value-of select="minutes-from-dateTime(xs:dateTime('2008-07-31T03:10:00+08:30'))"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>