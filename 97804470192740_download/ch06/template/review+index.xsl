<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="review.xsl"/>

<xsl:template match="review">
  <xsl:next-match/>
  <h2>Index of Works</h2>
  <table width="100%">
  <tr><th align="left">Composer</th><th align="left">Title</th><th align="left">Opus</th></tr>
  <xsl:apply-templates select="text" mode="index"/>
  </table>
</xsl:template>

<xsl:template match="text()" mode="index"/>

<xsl:template match="para/work" mode="index">
    <tr>
    <td><xsl:value-of select="@composer"/></td>   
    <td><xsl:value-of select="."/></td>   
    <td><xsl:value-of select="@opus"/></td>
    </tr>   
</xsl:template>

</xsl:stylesheet>