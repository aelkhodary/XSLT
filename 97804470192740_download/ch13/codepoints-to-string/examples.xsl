<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: codepoints-to-string --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="codepoints-to-string((65, 83, 67, 73, 73))"/></ex>
     <ex><xsl:value-of select="codepoints-to-string(48 to 57)"/></ex>
     <ex><xsl:value-of select="codepoints-to-string(())"/></ex>
     <ex><xsl:value-of select="for $n in 1 to 26 return codepoints-to-string(64+$n)"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>