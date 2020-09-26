<html xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xsl:version="2.0">
<head><title>A list of books</title></head>
<body>
<h1>A list of books</h1>
   <table border="2">
   <xsl:for-each select="//book">
      <xsl:sort select="author"/>
      <tr>
        <td><xsl:value-of select="author"/></td>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="@category"/></td>
        <td><xsl:value-of select="price"/></td>
      </tr>
   </xsl:for-each>
   </table>
</body>
</html>
