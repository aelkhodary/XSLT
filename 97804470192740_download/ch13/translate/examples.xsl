<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: translate --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template name="main">
   <out>
   	 <ex><xsl:value-of select="translate('aba12', 'abcd', 'ABCD')"/></ex>
   	 <ex><xsl:value-of select="translate('aba121', '12', '')"/></ex>
   	 <ex><xsl:value-of select="translate('a\b\c.xml', '\', '/')"/></ex>
   	 <ex><xsl:value-of select="translate('5,000.00', '.,', ',.')"/></ex>
   	 <ex><xsl:value-of select="translate('+44 118 948 3589', '&#x20;&#x9;&#xA;&#xD;()-', '')"/></ex>
   	 <xsl:variable name="X" select="'alufb49aj28j371jbsf'"/>
   	 <ex><xsl:value-of select="contains(translate($X, '0123456789', '9999999999'), '999')"/></ex>
   	 <ex><xsl:value-of select="translate($X, translate($X, '0123456789', ''), '')"/></ex>
	 </out>	 
   </xsl:template>

   
</xsl:stylesheet>