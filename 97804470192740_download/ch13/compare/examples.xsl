<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: compare -->
   
   <!-- To run this with a product other than Saxon, supply
        the appropriate collation URIs as parameters -->
        
   <xsl:param name="strong" as="xs:string" 
              select="'http://saxon.sf.net/collation?case-order=upper-first'"/>
   <xsl:param name="weak" as="xs:string" 
              select="'http://saxon.sf.net/collation?ignore-case=yes;ignore-modifiers=yes'"/>      
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template name="main">
   <out>
     <ex><xsl:value-of select="compare('espace', 'espacer')"/></ex>
     <ex><xsl:value-of select="compare('espace', 'espacé', $strong)"/></ex>
     <ex><xsl:value-of select="compare('espace', 'Espacé', $strong)"/></ex>
     <ex><xsl:value-of select="compare('espace', 'espacé', $weak)"/></ex>
     <ex><xsl:value-of select="compare('espacer', 'espacé', $strong)"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>