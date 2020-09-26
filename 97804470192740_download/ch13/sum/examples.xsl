<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: sum --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template name="main">
   <out>
   	 <ex><xsl:value-of select="sum((1, 2, 3, 4))"/></ex>
   	 <ex><xsl:value-of select="sum((1, 2, 3, 4.5))"/></ex>
   	 <ex><xsl:value-of select="sum((1, 2, 3.5e0, 4.5))"/></ex>
   	 <ex><xsl:value-of select="sum(())"/></ex>
   	 <ex><xsl:value-of select="sum((), 0.0e0)"/></ex>
   	 <ex><xsl:value-of select="sum((xs:dayTimeDuration('P3D'), xs:dayTimeDuration('PT36H')))"/></ex>
   	 <ex><xsl:value-of select="sum((), xs:dayTimeDuration('PT0S'))"/></ex>
	 </out>	 
   </xsl:template>

   
</xsl:stylesheet>