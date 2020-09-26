<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: nilled --> 
   
   <xsl:import-schema schema-location="source.xsd"/>
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template match="/schema-element(person)">
   <out>
     <ex><xsl:value-of select="nilled(title)"/></ex>
     <ex><xsl:value-of select="nilled(first)"/></ex>
     <ex><xsl:value-of select="nilled(middle)"/></ex>
     <ex><xsl:value-of select="nilled(last)"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>