<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:xs="http://www.w3.org/2001/XMLSchema"
     xpath-default-namespace="http://poetry.org/ns">
     
<xsl:param name="interval" select="4" as="xs:integer"/>     

<xsl:template match="/">
<html>
  <head><title><xsl:value-of select="/poem/title"/></title></head>
  <body>
    <h1><xsl:value-of select="/poem/title"/></h1>
    <p><xsl:apply-templates select="/poem/stanza"/></p>
  </body>
</html>
</xsl:template>

<xsl:template match="stanza">
  <p><table><xsl:apply-templates/></table></p>
</xsl:template> 

<xsl:template match="line">
  <tr>
    <td width="350"><xsl:value-of select="."/></td>
    <td width="50">
       <xsl:variable name="line-nr">
          <xsl:number level="any" from="poem"/>
       </xsl:variable>
       <xsl:if test="$line-nr mod $interval = 0">
          <xsl:value-of select="$line-nr"/>
       </xsl:if>
    </td>
  </tr>
</xsl:template>
</xsl:stylesheet>

