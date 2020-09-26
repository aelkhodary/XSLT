<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: deep-equal --> 
   
   <!-- If using a product other than Saxon, supply a parameter to set
        a suitable collation -->
        
   <xsl:variable name="weak" as="xs:string"
                 select="'http://saxon.sf.net/collation?ignore-case=yes'"/> 
                 
   <xsl:variable name="doc" as="document-node()"
                 select="/"/>                  
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template match="/">
   <out>
     <ex><xsl:value-of select="deep-equal((1,2,3), (1,2,3))"/></ex>
     <ex><xsl:value-of select="deep-equal((1,2,3), (3,2,1))"/></ex>
     <ex><xsl:value-of select="deep-equal((1,2), (1.0, 2.0))"/></ex>
     <ex><xsl:value-of select="deep-equal((), ())"/></ex>
     
     <ex><xsl:value-of select="deep-equal($doc/e[1], $doc/e[2])"/></ex>
     <ex><xsl:value-of select="deep-equal($doc/e[1], $doc/e[3], $weak)"/></ex>
     <ex><xsl:value-of select="deep-equal($doc/e[1]/@*, $doc/e[2]/@*, $weak)"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>