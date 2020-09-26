<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     
<xsl:output method="html" indent="yes"/>     

<xsl:template match="staff">
  <xsl:for-each-group select="employee" group-by="@department">
    <h2><xsl:value-of select="current-grouping-key()"/>
           <xsl:text> department</xsl:text></h2>
    <xsl:for-each select="current-group()">
      <p><xsl:value-of select="@name"/></p>
    </xsl:for-each>
  </xsl:for-each-group>
</xsl:template>


</xsl:stylesheet>

