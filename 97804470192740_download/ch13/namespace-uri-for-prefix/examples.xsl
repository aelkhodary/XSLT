<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: namespace-uri-for-prefix --> 
   
   <xsl:output method="xml" indent="yes" encoding="utf-8"/>
   
   <xsl:template match="*">
     <element name="{name()}" in-scope-namespaces="{for $n in in-scope-prefixes(.) return namespace-uri-for-prefix($n, .)}"/>
     <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="text()"/>

</xsl:stylesheet>