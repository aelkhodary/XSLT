<xsl:stylesheet version="2.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="books">
  <html><body>
    <h1>A list of books</h1>
    <table width="640">
      <xsl:apply-templates/>
    </table>
  </body></html>
</xsl:template>

<xsl:template match="book">
  <tr>
    <td><xsl:number/></td>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="author | title | price">
  <td><xsl:value-of select="."/></td>
</xsl:template>

</xsl:stylesheet>
