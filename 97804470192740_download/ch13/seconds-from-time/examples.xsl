<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: seconds-from-time --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template name="main">
   <out>
   	 <ex><xsl:value-of select="seconds-from-time(xs:time('12:35:03.142'))"/></ex>
		 <ex><xsl:value-of select="seconds-from-dateTime(xs:dateTime('2008-02-28T13:55:30-01:00'))"/></ex>
	 </out>	 
   </xsl:template>
   
   
</xsl:stylesheet>