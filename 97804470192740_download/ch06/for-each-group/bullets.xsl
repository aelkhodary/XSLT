<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     
<xsl:output method="html" indent="yes"/>     

<xsl:template match="section">
   <div>
      <xsl:for-each-group select="*"
                     group-adjacent="if (self::bullet) then 0 else position()">
           <xsl:apply-templates select="."/>
      </xsl:for-each-group>
   </div>
</xsl:template>

<xsl:template match="bullet">
  <ul>
    <xsl:apply-templates select="current-group()" mode="each-bullet"/>
  </ul>
</xsl:template>

<xsl:template match="para">
  <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="bullet" mode="each-bullet">
  <li><xsl:apply-templates/></li>
</xsl:template>



</xsl:stylesheet>

