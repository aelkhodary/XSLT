<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: exists --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template match="/">
   <out>
     <ex><xsl:value-of select="exists(/para)"/></ex>
     <ex><xsl:value-of select="exists(/para/a)"/></ex>
     <ex><xsl:value-of select="exists(/para/a/@style)"/></ex>
     <ex><xsl:value-of select="exists(/para/b)"/></ex>
     <ex><xsl:value-of select="exists(/para/a[2])"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>