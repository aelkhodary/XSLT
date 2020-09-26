<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi"
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: system-property --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template name="main">
   <out>
     <xsl:comment>
       Generated with XSLT stylesheet <xsl:value-of select="static-base-uri()"/>
       using <xsl:value-of select="system-property('xsl:product-name')"/>
       version <xsl:value-of select="system-property('xsl:product-version')"/>
     </xsl:comment>

   	 <ex><xsl:value-of select="'version:', system-property('xsl:version')"/></ex>
   	 <ex><xsl:value-of select="'vendor:', system-property('xsl:vendor')"/></ex>
   	 <ex><xsl:value-of select="'vendor-url:', system-property('xsl:vendor-url')"/></ex>
   	 <ex><xsl:value-of select="'product-name:', system-property('xsl:product-name')"/></ex>
   	 <ex><xsl:value-of select="'product-version:', system-property('xsl:product-version')"/></ex>
   	 <ex><xsl:value-of select="'is-schema-aware:', system-property('xsl:is-schema-aware')"/></ex>
   	 <ex><xsl:value-of select="'supports-serialization:', system-property('xsl:supports-serialization')"/></ex>
   	 <ex><xsl:value-of select="'supports-backwards-compatibility:', system-property('xsl:supports-backwards-compatibility')"/></ex>
	 </out>	 
   </xsl:template>

   
</xsl:stylesheet>