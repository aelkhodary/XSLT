<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: count --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:import-schema schema-location="source.xsd"/>

   <xsl:template match="document-node(schema-element(doc))">
   <out>
     <ex><xsl:value-of select="count(//obs)"/></ex>
     <ex><xsl:value-of select="count(//obs/@colors)"/></ex>
     <ex><xsl:value-of select="count(data(//obs/@colors))"/></ex>
     <ex><xsl:value-of select="count(//@*)"/></ex>
     <ex><xsl:value-of select="count(//obs/@date)"/></ex>
     <ex><xsl:value-of select="count((5 to 10))"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>