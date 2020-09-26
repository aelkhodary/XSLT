<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Single-match example for xsl:analyze-string -->
  
<xsl:template name="main">
  <date> 
		<xsl:analyze-string 
		             select="format-date(current-date(), '[D1o]#[MNn]#[Y]')"
		             regex="^([0-9]+)([a-z]+)#([A-Z][a-z]+)#(.*)$">
		   <xsl:matching-substring>
		      <xsl:value-of select="regex-group(1)"/>
		      <sup><i><xsl:value-of select="regex-group(2)"/></i></sup>
		      <xsl:text> </xsl:text>
		      <xsl:value-of select="regex-group(3)"/>
		      <xsl:text> </xsl:text>
		      <xsl:value-of select="regex-group(4)"/>
		   </xsl:matching-substring>
		   <xsl:non-matching-substring>
		      <xsl:value-of select="."/>
		   </xsl:non-matching-substring>
		</xsl:analyze-string>
	</date>
</xsl:template>	

</xsl:transform>
    