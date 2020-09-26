<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: upper-case --> 
   
   <xsl:output method="xml" indent="yes" encoding="utf-8"/>
   
   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="upper-case('Sunday')"/></ex>
     <ex><xsl:value-of select="upper-case('2+2')"/></ex>
     <ex><xsl:value-of select="upper-case('c&#xe9;sar')"/></ex>
     <ex><xsl:value-of select="upper-case('&#x03B5;&#x03BB;&#x03BB;&#x03B1;&#x03C3;')"/></ex>     
   </out>                      
   </xsl:template>
   
   

</xsl:stylesheet>