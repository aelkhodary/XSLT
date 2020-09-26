<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: adjust-(date|dateTime|time)-to-timezone --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <xsl:variable name="EST" select="xs:dayTimeDuration('-PT5H')" as="xs:dayTimeDuration"/>
   <out>
     <ex><xsl:value-of select="adjust-time-to-timezone(xs:time('15:00:00+01:00'), $EST)"/></ex>
     <ex><xsl:value-of select="adjust-time-to-timezone(xs:time('15:00:00'), $EST)"/></ex>
     <ex><xsl:value-of select="adjust-time-to-timezone(xs:time('15:00:00+01:00'))"/></ex>
     <ex><xsl:value-of select="adjust-time-to-timezone(xs:time('15:00:00+01:00'), ())"/></ex>
     <ex><xsl:value-of select="adjust-time-to-timezone(xs:time('15:00:00'), ())"/></ex>
     <ex><xsl:value-of select="adjust-dateTime-to-timezone(xs:dateTime('2008-03-01T15:00:00+01:00'), $EST)"/></ex>
     <ex><xsl:value-of select="adjust-dateTime-to-timezone(xs:dateTime('2008-03-01T15:00:00'), $EST)"/></ex>
     <ex><xsl:value-of select="adjust-dateTime-to-timezone(xs:dateTime('2008-03-01T15:00:00+01:00'))"/></ex>
     <ex><xsl:value-of select="adjust-dateTime-to-timezone(xs:dateTime('2008-03-01T15:00:00+01:00'), ())"/></ex>
     <ex><xsl:value-of select="adjust-dateTime-to-timezone(xs:dateTime('2008-03-01T15:00:00'), ())"/></ex>
     <ex><xsl:value-of select="adjust-date-to-timezone(xs:date('2008-03-01+01:00'), $EST)"/></ex>
     <ex><xsl:value-of select="adjust-date-to-timezone(xs:date('2008-03-01'), $EST)"/></ex>
     <ex><xsl:value-of select="adjust-date-to-timezone(xs:date('2008-03-01+01:00'))"/></ex>
     <ex><xsl:value-of select="adjust-date-to-timezone(xs:date('2008-03-01+01:00'), ())"/></ex>
     <ex><xsl:value-of select="adjust-date-to-timezone(xs:date('2008-03-01'), ())"/></ex>     
   </out>                      
   </xsl:template>

</xsl:stylesheet>