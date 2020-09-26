<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:my="http://mhk.me.uk/some.uri"
                exclude-result-prefixes="xs xsi my"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: QName --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
  
   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="QName('http://www.w3.org/ XML/1998/namespace', 'xml:space')"/></ex>
     <ex><xsl:value-of select="QName('http://www.w3.org/ 2001/XMLSchema-instance', 'xsi:type')"/></ex>
     <ex><xsl:value-of select="QName('', 'html')"/></ex>
     <ex><xsl:value-of select="QName('http://www.w3.org/1999/xhtml', 'html')"/></ex>
   </out>                      
   </xsl:template>
   
   <xsl:template match="/">
     <xsl:message terminate="yes">Input has not been validated</xsl:message>
   </xsl:template>

</xsl:stylesheet>