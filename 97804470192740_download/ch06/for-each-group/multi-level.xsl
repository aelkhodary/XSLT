<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     
<xsl:output method="html" indent="yes"/>     

<xsl:template match="staff">
  <xsl:for-each-group select="employee" 
                      group-by="@location">
    <xsl:sort select="current-grouping-key()"/>
    <p class="indent0">
       <xsl:text>Location: </xsl:text>
       <xsl:value-of select="current-grouping-key()"/>
    </p>
    <xsl:for-each-group select="current-group()" 
                        group-by="@department">
      <xsl:sort select="current-grouping-key()"/>
      <p class="indent1">
         <xsl:text>Department: </xsl:text>
         <xsl:value-of select="current-grouping-key()"/>
      </p>
      <xsl:for-each select="current-group()">
        <xsl:sort select="@name"/>
        <p class="indent2">
           <xsl:value-of select="@name"/>
        </p>
      </xsl:for-each>
    </xsl:for-each-group>
  </xsl:for-each-group>
</xsl:template>


</xsl:stylesheet>

