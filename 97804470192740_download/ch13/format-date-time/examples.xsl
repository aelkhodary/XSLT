<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: format-date|dateTime|time --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:param name="date" as="xs:date" select="xs:date('2008-11-03')"/>
   <xsl:param name="time" as="xs:time" select="xs:time('09:30:02.26-05:00')"/>
   <xsl:param name="dateTime" as="xs:dateTime" select="dateTime($date, $time)"/>

   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="format-date($date, '[D]/[M]/[Y]')"/></ex>
     <ex><xsl:value-of select="format-date($date, '[M]/[D]/[Y]')"/></ex>
     <ex><xsl:value-of select="format-date($date, '[MNn] [Do], [Y] [E]')"/></ex>
     <ex><xsl:value-of select="format-date($date, '[Y]-[M,2]-[D,2]')"/></ex>
     <ex><xsl:value-of select="format-date($date, '[MN] [YI]')"/></ex>
     <ex><xsl:value-of select="format-date($date, '[Y][[week [W]:[FNn]]]')"/></ex>
     <ex><xsl:value-of select="format-time($time, '[H01].[m01]')"/></ex>
     <ex><xsl:value-of select="format-time($time, '[h].[m01] [P]')"/></ex>
     <ex><xsl:value-of select="format-time($time, '[H01]:[m01]:[s01].[f001] [ZN]')"/></ex>
     <ex><xsl:value-of select="format-dateTime($dateTime, '[D]/[M]/[Y] at [H01][m01]')"/></ex>
     <ex><xsl:value-of select="format-dateTime($dateTime, '[h].[m01] [P] on [DWwo] [MNn], [YWw]')"/></ex>  
   </out>                      
   </xsl:template>

</xsl:stylesheet>