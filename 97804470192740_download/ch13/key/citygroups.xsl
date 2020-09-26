<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>
<xsl:key name="country-group" match="city" use="@country"/>

<xsl:template match="/">
  <html><body>
   <xsl:for-each select="//city[. is key('country-group', @country)[1]]">
      <h1><xsl:value-of select="@country"/></h1>
      <xsl:for-each select="key('country-group', @country)">
         <xsl:value-of select="@name"/><br/>
      </xsl:for-each>
   </xsl:for-each>
  </body></html>
</xsl:template>
</xsl:transform>

