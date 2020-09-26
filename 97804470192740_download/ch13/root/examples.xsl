<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: root --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
  
   <xsl:template name="main">
   <out>
     <xsl:for-each select="$e">
		     <ex><xsl:value-of select="root()/name()"/></ex>
   	 </xsl:for-each>
   	 <xsl:variable name="x" select="$e[1]"/>   	
   	 <ex><xsl:value-of select="root($x)/name()"/></ex>
		 <ex><xsl:value-of select="$seq/root()/name()"/></ex>
	 </out>	 
   </xsl:template>
   
   <xsl:variable name="seq" as="element()*">
     <a1><b><c><d><e/></d></c></b></a1>
     <a2><b><c><d><e/></d></c></b></a2>
     <a3><b><c><d><e/></d></c></b></a3>
     <a4><b><c><d><e/></d></c></b></a4>
   </xsl:variable>
   
   <xsl:variable name="e" as="element()*" select="$seq//e"/>
   
</xsl:stylesheet>