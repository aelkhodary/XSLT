<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: data --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:import-schema schema-location="source.xsd"/>

   <xsl:template match="document-node(schema-element(rows))">
   <xsl:variable name="x" select="*"/>
   <out>
     <ex><xsl:value-of select="data($x/row/@number)"/></ex>
     <ex><xsl:value-of select="data($x/row/@colors)"/></ex>
     <!-- Following example commented out because it throws an error
       <ex><xsl:value-of select="data($x)"/></ex>
     -->  
     <ex><xsl:value-of select="data($x/row)"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>