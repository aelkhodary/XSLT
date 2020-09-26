<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: local-name --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
   
   <xsl:template match="/">
   <out>
     <ex><xsl:copy-of select="local-name(/)"/></ex>
     <ex><xsl:copy-of select="local-name(/*)"/></ex>
     <ex><xsl:copy-of select="local-name(/*/@*[.='high'])"/></ex>
     <ex><xsl:copy-of select="local-name(/*/@*[.='A23'])"/></ex>
     
     <xsl:apply-templates mode="tabulate"/>
     
   </out>                      
   </xsl:template>
   
   
   <xsl:template match="*" mode="tabulate">
   <table>
      <xsl:for-each select="attribute::node()">
      <xsl:sort select="namespace-uri()"/>
      <xsl:sort select="local-name()"/>
         <tr>
         <td><xsl:value-of select="namespace-uri()"/></td>
         <td><xsl:value-of select="local-name()"/></td>
         <td><xsl:value-of select="."/></td>
         </tr>
      </xsl:for-each>
   </table>
</xsl:template>


</xsl:stylesheet>