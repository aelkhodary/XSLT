<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: lang --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:param name="p" select="'123'"/>

   <xsl:template match="/">
   <out>
     <ex><xsl:value-of select="boolean(//*[lang('de')])"/></ex>
     <ex><xsl:value-of select="/*/msg[@code=$p][lang('fr')]"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>