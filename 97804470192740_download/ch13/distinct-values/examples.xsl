<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: distinct-values --> 
     
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template match="/" default-collation="http://saxon.sf.net/collation?ignore-case=yes">
   <out>
     <ex><xsl:value-of select="distinct-values((1, 2, 3, 3.5, 2.0, 1.0))"/></ex>
     <ex><xsl:value-of select="distinct-values(('A', 'B', 'C', 'a', 'b', 'c'))"/></ex>
     <ex><xsl:value-of select="distinct-values((xs:time('12:20:02Z'), xs:time('13:20:02+01:00')))"/></ex>
     <ex><xsl:value-of select="distinct-values((1, 'a', current-date()))"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>