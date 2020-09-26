<xsl:stylesheet 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="xs"
   version="2.0">

<xsl:key name="pub" match="book" use="publisher"/>

<xsl:variable name="in" select="/" as="document-node()"/>

<xsl:variable name="publishers" as="xs:string*"
   select="distinct-values(/booklist/book/publisher)"/>

<xsl:template match="/">
<html>
<head>
   <title>Sales volume by publisher</title>
</head>
<body>
   <h1>Sales volume by publisher</h1>
   <table>
      <tr>
         <th>Publisher</th><th>Total Sales Value</th>
      </tr>
      <xsl:for-each select="$publishers">
         <tr>
            <td><xsl:value-of select="."/></td>
            <td><xsl:call-template name="total-sales"/></td>
         </tr>
      </xsl:for-each>
   </table>
</body>
</html>
</xsl:template>

<!-- calculate total book sales for the current publisher -->
<xsl:template name="total-sales">
   <xsl:param name="publisher" select="."/>
   <xsl:value-of select="sum($in/key('pub',$publisher)/sales)"/>
</xsl:template>
</xsl:stylesheet>

