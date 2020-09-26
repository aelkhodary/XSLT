<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Multiple-match example for xsl:analyze-string -->
  
  
<!-- The value of the supplied parameter should be an XPath expression -->  
<xsl:param name="param" select="'for $x in 1 to 100, $y in 5 to 10 return $x + $y'"/>  
  
<xsl:template name="main">
  <variables> 
		<xsl:analyze-string select="$param" regex="\$\s*(\i\c*)">
	    <xsl:matching-substring>
	        <ref><xsl:value-of select="regex-group(1)"/></ref>
	    </xsl:matching-substring>
    </xsl:analyze-string>
	</variables>
</xsl:template>	

</xsl:transform>
    