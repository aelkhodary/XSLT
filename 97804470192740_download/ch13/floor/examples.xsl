<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: floor --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="floor(1.0)"/></ex>
     <ex><xsl:value-of select="floor(1.6e0)"/></ex>
     <ex><xsl:value-of select="floor(17 div 3)"/></ex>
     <ex><xsl:value-of select="floor(-3.0)"/></ex>
     <ex><xsl:value-of select="floor(-8.2e0)"/></ex>
     <ex><xsl:value-of select="floor(number('NaN'))"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>