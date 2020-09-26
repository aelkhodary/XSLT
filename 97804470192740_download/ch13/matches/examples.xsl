<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: matches --> 
   
   <xsl:output method="xml" indent="yes" encoding="utf-8"/>
   
   <xsl:template match="/">
   <out>
     <xsl:variable name="e" select="verse"/>
     <ex><xsl:value-of select="matches($e, 'grand')"/></ex>
     <ex><xsl:value-of select="matches($e, '^The finest', 'm')"/></ex>
     <ex><xsl:value-of select="matches($e, '(^.*$)*', 'm')"/></ex>
     <ex><xsl:value-of select="matches($e, 'Albert.*Woolworth''s', 's')"/></ex>
     <ex><xsl:value-of select="matches($e, 'woolworth''s', 'i')"/></ex>
     <ex><xsl:value-of select="matches('banana', '^(.a)+$')"/></ex>
     <ex><xsl:value-of select="matches('23 May 2008', '^[0-9]+\s[A-Z][a-z]+\s[0-9]+$')"/></ex>
     <ex><xsl:value-of select="matches('', 'a*')"/></ex>
   </out>                      
   </xsl:template>
   
   

</xsl:stylesheet>