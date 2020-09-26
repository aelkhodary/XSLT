<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     
<xsl:output method="html" indent="yes"/>     

<xsl:template match="SPEECH">
  <tr>
  <xsl:for-each-group select="*" 
           group-adjacent="if (self::SPEAKER) then 0 else 1">
    <td valign="top">
       <xsl:for-each select="current-group()">
          <xsl:apply-templates select="."/>
          <xsl:if test="position()!=last()"><br/></xsl:if>
       </xsl:for-each>
    </td>
  </xsl:for-each-group>
  </tr>
</xsl:template>

<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="PLAY/TITLE"/></title>
  </head>
  <body>
    <h1><xsl:value-of select="PLAY/TITLE"/></h1>
    <xsl:apply-templates select="PLAY/ACT"/>
  </body>
</html>
</xsl:template>

<xsl:template match="ACT">
  <h2><xsl:value-of select="TITLE"/></h2>
  <xsl:apply-templates select="* except TITLE"/>
</xsl:template>

<xsl:template match="ACT/*">
  <h3><xsl:value-of select="TITLE"/></h3>
  <table>
    <xsl:apply-templates select="* except TITLE"/>
  </table>  
</xsl:template>

<xsl:template match="SCENE/STAGEDIR">
<tr><td colspan="2"><i>&#xa0;&#xa0;<xsl:value-of select="."/></i></td></tr>
</xsl:template>

<xsl:template match="SPEECH/STAGEDIR">
<p><i>&#xa0;&#xa0;<xsl:value-of select="."/></i></p>
</xsl:template>


</xsl:stylesheet>

