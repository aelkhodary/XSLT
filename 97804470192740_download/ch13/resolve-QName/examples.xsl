<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: resolve-QName --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
  
   <xsl:template match="/">
   <out>
      <xsl:variable name="doc" select="/top:doc" 
              xmlns:top="http://mhk.me.uk/default.uri"/>
			<xsl:variable name="chap" select="$doc/chap"/>
			<xsl:variable name="data1" select="$doc/chap/data-one"/>
			<xsl:variable name="data2" select="$doc/chap/data-two"/>

     <ex><xsl:value-of select="resolve-QName($doc/*[1], $doc)"/></ex>
     <ex><xsl:value-of select="resolve-QName($chap/@att-one, $chap)"/></ex>
     <ex><xsl:value-of select="resolve-QName(string($data1), $data1)"/></ex>
     <ex><xsl:value-of select="resolve-QName(string($data2), $data2)"/></ex>
 

   </out>                      
   </xsl:template>
   
</xsl:stylesheet>