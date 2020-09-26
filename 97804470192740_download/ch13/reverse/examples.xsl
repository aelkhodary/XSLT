<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: reverse --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
  
   <xsl:template name="main">
   <out xml:base="http://a/b/c/d;p?q">
     <ex><xsl:value-of select="reverse(1 to 5)"/></ex>
     <ex><xsl:value-of select="reverse(1)"/></ex>
     <ex><xsl:value-of select="reverse(())"/></ex>
     <ex><xsl:value-of select="reverse($e/ancestor::*)/name()"/></ex>
   </out>                      
   </xsl:template>
   
   <xsl:variable name="tree">
     <a><b><c><d><e/></d></c></b></a>
   </xsl:variable>
   
   <xsl:variable name="e" as="node()" select="$tree//e"/>
   
</xsl:stylesheet>