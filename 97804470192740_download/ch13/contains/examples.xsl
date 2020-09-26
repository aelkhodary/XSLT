<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: contains --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="contains('Shakespeare', 'spear')"/></ex>
     <ex><xsl:value-of select="contains('', 'a')"/></ex>
     <ex><xsl:value-of select="contains('Shakespeare', '')"/></ex>
     <ex><xsl:value-of select="contains('', '')"/></ex>
     <ex><xsl:value-of select="contains((), 'a')"/></ex>   
   </out>                      
   </xsl:template>

</xsl:stylesheet>