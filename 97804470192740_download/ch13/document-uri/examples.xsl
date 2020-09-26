<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- This stylesheet depends on the way the collection() function is implemented -->
   
   <!-- Chapter 13: document-uri --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <out>
			<xsl:for-each select="collection('documents')">
			   <xsl:sort select="/doc/title"/>
			   <p><a href="{document-uri(.)}">
			        <xsl:value-of select="/doc/title"/>
			      </a>
			   </p>
			</xsl:for-each>
   </out>                      
   </xsl:template>

</xsl:stylesheet>