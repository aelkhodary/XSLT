<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: empty --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template match="/">
   <out>
     <ex><xsl:value-of select="empty(/para)"/></ex>
     <ex><xsl:value-of select="empty(/para/a)"/></ex>
     <ex><xsl:value-of select="empty(/para/a/@style)"/></ex>
     <ex><xsl:value-of select="empty(/para/b)"/></ex>
     <ex><xsl:value-of select="empty(/para/a[2])"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>