<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: subsequence --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template name="main">
   <out>
   	 <ex><xsl:value-of select="subsequence(3 to 10, 2)"/></ex>
   	 <ex><xsl:value-of select="subsequence(3 to 10, 5, 2)"/></ex>
   	 <ex><xsl:value-of select="subsequence(1 to 5, 10)"/></ex>
   	 <ex><xsl:value-of select="subsequence(1 to 10, 2.3, 4.6)"/></ex>
	 </out>	 
   </xsl:template>

   
</xsl:stylesheet>