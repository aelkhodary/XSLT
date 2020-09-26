<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:oxsl="http://www.w3.org/local-alias">

<xsl:param name="variable-name">v</xsl:param>
<xsl:param name="default-value"/>
<xsl:output indent="yes"/>

<xsl:namespace-alias
               stylesheet-prefix="oxsl"
               result-prefix="xsl"/>

<xsl:template match="/" name="main">
   <oxsl:stylesheet version="1.0">
   <oxsl:variable name="{$variable-name}">
      <xsl:value-of select="$default-value"/>
   </oxsl:variable>
   </oxsl:stylesheet>
</xsl:template>

</xsl:stylesheet>

