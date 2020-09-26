<xsl:stylesheet version="2.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      
      <!-- Stylesheet comment.xsl - demonstrate use of xsl:comment -->

<xsl:param name="schema-version" select="4.0"/>

<xsl:template name="main">
<xsl:comment>
   <xsl:text> Generated on: </xsl:text> 
   <xsl:value-of select="format-dateTime(
                            current-dateTime(), 
                            '[D] [MNn] [Y] at [H]:[m]:[s]')"/>
   <xsl:text> using </xsl:text>
   <xsl:value-of select="system-property('xsl:product-name')"/>
   <xsl:text> version </xsl:text>
   <xsl:value-of select="system-property('xsl:product-version')"/>
</xsl:comment>

<script language="JavaScript">
   <xsl:comment>
      function bk(n) {
         parent.frames["content"].location="chap" + n + ".1.html";
      }
   //</xsl:comment>
</script>


</xsl:template>
</xsl:stylesheet>

