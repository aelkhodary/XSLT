<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: ceiling --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="ceiling(1.0)"/></ex>
     <ex><xsl:value-of select="ceiling(1.6)"/></ex>
     <ex><xsl:value-of select="ceiling(17 div 3)"/></ex>
     <ex><xsl:value-of select="ceiling(-3.0)"/></ex>
     <ex><xsl:value-of select="ceiling(-8.2e0)"/></ex>
     <ex><xsl:value-of select="ceiling(number('xxx'))"/></ex>
     <ex><xsl:value-of select="ceiling(-0.5e0)"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>