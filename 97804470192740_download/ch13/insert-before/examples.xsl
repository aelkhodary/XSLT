<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
                exclude-result-prefixes="xs soap"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: insert-before --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="insert-before(1 to 5, 4, (99, 100))"/></ex>
     <ex><xsl:value-of select="insert-before(1 to 5, 0, 99)"/></ex>
     <ex><xsl:value-of select="insert-before(1 to 5, 10, 99)"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>