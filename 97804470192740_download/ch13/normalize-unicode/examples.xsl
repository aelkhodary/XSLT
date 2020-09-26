<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: normalize-unicode --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template name="main">
   <out>
     <xsl:variable name="initial" select="'garçon'"/>
     <xsl:variable name="nfc" select="normalize-unicode($initial)"/>
     <xsl:variable name="nfd" select="normalize-unicode($initial, 'NFD')"/>
     <xsl:variable name="nfc2" select="normalize-unicode($initial, 'NFC')"/>
     <ex><xsl:value-of select="string-to-codepoints($initial)"/></ex>
     <ex><xsl:value-of select="string-to-codepoints($nfc)"/></ex>
     <ex><xsl:value-of select="string-to-codepoints($nfd)"/></ex>
     <ex><xsl:value-of select="string-to-codepoints($nfc2)"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>