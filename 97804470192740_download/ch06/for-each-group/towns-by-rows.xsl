<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     
<xsl:output method="xml" indent="yes"/>

<xsl:param name="cols" select="4"/>     

<xsl:template match="towns">
<table>
  <xsl:for-each-group select="town" 
                    group-adjacent="(position()-1) idiv $cols">
  <tr>
     <xsl:for-each select="current-group()">
       <td>
         <xsl:value-of select="."/>
       </td>
     </xsl:for-each>
  </tr>
  </xsl:for-each-group>
</table>
</xsl:template>


</xsl:stylesheet>

