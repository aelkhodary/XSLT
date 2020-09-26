<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: count --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
		<xsl:template match="/">
		  <out>
		    <xsl:for-each-group select='//book' group-by='author'>
		      <xsl:sort select='current-grouping-key()'/>
		      <h2><xsl:value-of select='current-grouping-key()'/></h2>
		      <xsl:apply-templates select='current-group()'/>
		    </xsl:for-each-group>
		  </out>
		</xsl:template>
		
		<xsl:template match="book">
		  <p><xsl:value-of select="title"/></p>
		</xsl:template>

</xsl:stylesheet>
