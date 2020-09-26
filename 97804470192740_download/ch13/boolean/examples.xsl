<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: boolean --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template match="/">
   <xsl:variable name="John" select="/doc/emp[1]" as="element(emp)"/>
   <xsl:variable name="Mary" select="/doc/emp[2]" as="element(emp)"/>
   <out>
     <ex><xsl:value-of select="boolean(//emp[@age=21])"/></ex>
     <ex><xsl:value-of select="boolean(//emp[@age=53])"/></ex>
     <ex><xsl:value-of select="boolean(number($John/@age))"/></ex>
     <ex><xsl:value-of select="boolean(number($Mary/@age))"/></ex>
     <ex><xsl:value-of select="boolean(count($John/*))"/></ex>
     <ex><xsl:value-of select="boolean(string($John/@surname))"/></ex>
     <ex><xsl:value-of select="boolean(string($John/@name))"/></ex>
     <ex><xsl:value-of select="boolean('true')"/></ex>
     <ex><xsl:value-of select="boolean('false')"/></ex>    
   </out>                      
   </xsl:template>
   
   <xsl:template name="example2">
     <xsl:if test="boolean(//header) != boolean(//footer)">
       <xsl:message>Document must contain headers and footers,
                                  or neither</xsl:message>
     </xsl:if>   
   </xsl:template>
   
   <xsl:template name="example3">
     <xsl:variable name="uses-footnotes" select="boolean(//footnote)"/>
     <xsl:if test="$uses-footnotes">
       <contains-footnotes/>
     </xsl:if>  
   </xsl:template>   

</xsl:stylesheet>