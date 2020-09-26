<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: last --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template match="/">
   <out>
     <ex><xsl:copy-of select="countries/country[last()]"/></ex>
     <ex><xsl:copy-of select="countries/country[@continent='Europe'][last()]"/></ex>
     <ex><xsl:copy-of select="countries/country[@continent='Europe'][last()-1]"/></ex>
     <ex><xsl:copy-of select="countries/country[@continent='Africa'][position() != last()]"/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>