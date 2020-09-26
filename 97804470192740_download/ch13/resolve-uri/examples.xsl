<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: resolve-uri --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
  
   <xsl:template name="main">
   <out xml:base="http://a/b/c/d;p?q">
     <ex><xsl:value-of select="resolve-uri('g')"/></ex>
     <ex><xsl:value-of select="resolve-uri('./g')"/></ex>
     <ex><xsl:value-of select="resolve-uri('g/')"/></ex>
     <ex><xsl:value-of select="resolve-uri('/g')"/></ex>
     <ex><xsl:value-of select="resolve-uri('?y')"/></ex>
     <ex><xsl:value-of select="resolve-uri('g?y')"/></ex>
     <ex><xsl:value-of select="resolve-uri('')"/></ex>
     <ex><xsl:value-of select="resolve-uri('#s')"/></ex>
     <ex><xsl:value-of select="resolve-uri('../g') "/></ex>
   </out>                      
   </xsl:template>
   
</xsl:stylesheet>