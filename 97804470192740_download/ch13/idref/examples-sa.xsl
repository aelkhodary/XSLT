<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: idref -->
   
   <xsl:import-schema schema-location="source.xsd"/> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template match="document-node(schema-element(persons))">
   <out>
     <xsl:variable name="HMQ" select="(//person)[1]"/>
     <xsl:for-each select="idref($HMQ/@id)/(parent::father|parent::mother)/parent::person">
       <ex><xsl:value-of select="name"/></ex>
     </xsl:for-each>
   </out>                      
   </xsl:template>

</xsl:stylesheet>