<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

   <!-- Examples for Chapter 7, quoted strings in attribute values -->
   

<xsl:template name="main">
  <output>
    <a><xsl:value-of select="'John''s'"/></a>
    <a><xsl:value-of select="'&quot;'"/></a>
    <a><xsl:value-of select="'Don''t say &quot;yes&quot;'"/></a>        
  </output>
</xsl:template>

</xsl:stylesheet>                                