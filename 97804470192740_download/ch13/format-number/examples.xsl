<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: format-number --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="format-number(1234.5, '#,##0.00')"/></ex>
     <ex><xsl:value-of select="format-number(123.456, '#,##0.00')"/></ex>
     <ex><xsl:value-of select="format-number(1000000, '#,##0.00')"/></ex>
     <ex><xsl:value-of select="format-number(-59, '#,##0.00')"/></ex>
     <ex><xsl:value-of select="format-number(1 div 0.0e0, '#,##0.00')"/></ex>
     <ex><xsl:value-of select="format-number(1234, '###0.0###')"/></ex>
     <ex><xsl:value-of select="format-number(1234.5, '###0.0###')"/></ex>
     <ex><xsl:value-of select="format-number(.00025, '###0.0###')"/></ex>
     <ex><xsl:value-of select="format-number(.00035, '###0.0###')"/></ex>
     <ex><xsl:value-of select="format-number(0.25, '#00%')"/></ex>
     <ex><xsl:value-of select="format-number(0.736, '#00%')"/></ex>
     <ex><xsl:value-of select="format-number(1, '#00%')"/></ex>
     <ex><xsl:value-of select="format-number(-42, '#00%')"/></ex>
     <ex><xsl:value-of select="format-number(-3.12, '#.00;(#.00)')"/></ex>
     <ex><xsl:value-of select="format-number(-3.12, ' #.00;#.00CR')"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>