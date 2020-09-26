<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: round --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
  
   <xsl:template name="main">
   <out>
   	 <ex><xsl:value-of select="round(3.2)"/></ex>
		 <ex><xsl:value-of select="round(4.6e0)"/></ex>
		 <ex><xsl:value-of select="round(7.5)"/></ex>
		 <ex><xsl:value-of select="round(-7.5)"/></ex>
		 <ex><xsl:value-of select="round(-0.0e0)"/></ex>
	 </out>	 
   </xsl:template>
   
   
</xsl:stylesheet>