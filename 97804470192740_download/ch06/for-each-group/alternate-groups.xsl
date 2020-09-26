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
    <title><xsl:value-of select="SCENE/TITLE"/></title>
  </head>
  <body>
    <h1><xsl:value-of select="SCENE/TITLE"/></h1>
    <xsl:apply-templates select="SCENE"/>
  </body>
</html>
</xsl:template>

<xsl:template match="ACT">
  <h2><xsl:value-of select="TITLE"/></h2>
  <xsl:apply-templates select="* except TITLE"/>
</xsl:template>

  
<xsl:template match="SCENE">
<table>
  <xsl:variable name="sequence" as="element()*">
    <xsl:for-each-group select="* except TITLE" 
        group-adjacent="if (self::SPEAKER) 
                        then 'SPEAKERS' else 'LINES'">
      <xsl:element name="{current-grouping-key()}">
        <xsl:copy-of select="current-group()"/>
      </xsl:element>
    </xsl:for-each-group>
  </xsl:variable>

  <xsl:for-each-group select="$sequence" group-starting-with="SPEAKERS">
    <tr>
      <xsl:for-each select="current-group()">
        <td valign="top">
          <xsl:for-each select="*">
            <xsl:apply-templates select="."/>  
            <xsl:if test="position() != last()"><br/></xsl:if>
          </xsl:for-each>
        </td>
      </xsl:for-each>
    </tr>
  </xsl:for-each-group>
</table>
</xsl:template>   

<xsl:template match="STAGEDIR">
<i>&#xa0;&#xa0;<xsl:value-of select="."/></i>
</xsl:template>

</xsl:stylesheet>

