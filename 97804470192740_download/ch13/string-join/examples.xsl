<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: string-join --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template name="main">
   <out>
   	 <ex><xsl:value-of select="string-join(('a', 'b', 'c'), ', ')"/></ex>
   	 <ex><xsl:value-of select="string-join(('A', 'B', 'C'), '')"/></ex>
   	 <ex><xsl:value-of select="string-join('Z', '+')"/></ex>
   	 <ex><xsl:value-of select="string-join((), '~')"/></ex>
     <ex><xsl:value-of select="string-join($e/ancestor-or-self::*/name(), '/')"/></ex>
	 </out>	 
   </xsl:template>
   
   <xsl:variable name="seq" as="element()">
     <a1><b><c><d><e/></d></c></b></a1>
   </xsl:variable>
   
   <xsl:variable name="e" as="element()*" select="$seq//e"/>   
   
   
</xsl:stylesheet>