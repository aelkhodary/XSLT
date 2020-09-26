<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: error -->
   
   <!-- Each entry point to this stylesheet demonstrates a different call on the error() function -->
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="e0">
   <out>
     <ex><xsl:value-of select="error()"/></ex>
   </out>                      
   </xsl:template>
   
   <xsl:template name="e1">
   <out>
     <ex><xsl:value-of select="error(xs:QName('docbook:invalid-page-ref'))"
                               xmlns:docbook="http://docbook.org/ns"/></ex>
   </out>                      
   </xsl:template> 
   
   <xsl:template name="e2">
   <out>
     <ex><xsl:value-of select="error((), 'Invalid parameter value')"/></ex>
   </out>                      
   </xsl:template>     

</xsl:stylesheet>