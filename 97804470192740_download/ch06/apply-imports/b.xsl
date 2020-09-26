<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Example for xsl:apply-imports: b.xsl -->
  
<xsl:import href="a.xsl"/>

<xsl:template match="timeline/date">
   <b>
     <xsl:apply-imports/>
   </b>
</xsl:template>

<xsl:template match="/">
<out>
  <xsl:apply-templates/>
</out>
</xsl:template>

</xsl:transform>
    