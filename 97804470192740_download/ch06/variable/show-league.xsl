<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>

<xsl:import href="league.xsl"/>

<xsl:variable name="league">
  <xsl:apply-templates select="results"/>
</xsl:variable>


<xsl:template match="/">
<html>
  <head><title>League Table</title></head>
  <body>
    <h1>League Table</h1>
    <table border="2" cellpadding="5">
      <thead>
        <th>Team</th>
        <th>Played</th>
        <th>Won</th>
        <th>Lost</th>
        <th>Drawn</th>
        <th>For</th>
        <th>Against</th>
      </thead>
      <tbody>
      <xsl:for-each select="$league/league/team">
        <tr>
          <td><xsl:value-of select="@name"/></td>
          <td><xsl:value-of select="@played"/></td>
          <td><xsl:value-of select="@won"/></td>
          <td><xsl:value-of select="@lost"/></td>
          <td><xsl:value-of select="@drawn"/></td>
          <td><xsl:value-of select="@for"/></td>
          <td><xsl:value-of select="@against"/></td>
        </tr>
      </xsl:for-each>
      </tbody>
    </table>          
  </body>
</html>
</xsl:template>

</xsl:transform>
