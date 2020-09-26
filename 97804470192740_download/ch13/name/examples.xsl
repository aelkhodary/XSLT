<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: name --> 
   
   <xsl:output method="xml" indent="yes" encoding="utf-8"/>
   
   <xsl:template match="/">
   <out>
     <ex><xsl:value-of select="name(/)"/></ex>
     <ex><xsl:value-of select="name(/*)"/></ex>
     <ex><xsl:value-of select="name(/*/@*[.='high'])"/></ex>
     <ex><xsl:value-of select="name(/*/@*[.='A23'])"/></ex>
     <ex><xsl:value-of select="name(//comment())"/></ex>
     <ex><xsl:value-of select="name((//text())[1])"/></ex>
     <ex><xsl:value-of select="name(//processing-instruction())"/></ex>
     <ex><xsl:value-of select="name(//namespace::my)"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>