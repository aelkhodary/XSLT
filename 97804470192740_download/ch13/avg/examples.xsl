<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: abs --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="avg((1.0, 2.6, 3.0))"/></ex>
     <ex><xsl:value-of select="avg(())"/></ex>
     <ex><xsl:value-of select="avg((1, xs:float('3.5'), 5.5))"/></ex>
     <ex><xsl:value-of select="avg((1, 2, 3))"/></ex>
     <ex><xsl:value-of select="avg((xs:dayTimeDuration('P1D'), xs:dayTimeDuration('PT12H')))"/></ex>  
   </out>                      
   </xsl:template>

</xsl:stylesheet>