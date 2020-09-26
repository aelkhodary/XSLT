<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: lower-case --> 
   
   <xsl:output method="xml" indent="yes" encoding="utf-8"/>
   
   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="lower-case('Sunday')"/></ex>
     <ex><xsl:value-of select="lower-case('2+2')"/></ex>
     <ex><xsl:value-of select="lower-case('CÉSAR')"/></ex>
     <ex><xsl:value-of select="lower-case('&#x0395;&#x039B;&#x039B;&#x0391;&#x03A3;')"/></ex>     
   </out>                      
   </xsl:template>
   
   

</xsl:stylesheet>