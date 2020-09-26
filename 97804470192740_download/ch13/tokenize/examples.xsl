<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: tokenize --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template name="main">
   <out>
   	 <ex><xsl:value-of select="tokenize('Go home, Jack!', '\W+')" separator="|"/></ex>
   	 <ex><xsl:value-of select="tokenize('abc[NL]def[XY]', '\[.*?\]')" separator="|"/></ex>
   	 <xsl:variable name="input" select="'W151TBH'"/>
   	 <ex><xsl:value-of select="tokenize(replace($input, '([0-9]+|[A-Za-z]+)', '$1#'), '#')[.]" separator="|"/></ex>
	 </out>	 
   </xsl:template>

   
</xsl:stylesheet>