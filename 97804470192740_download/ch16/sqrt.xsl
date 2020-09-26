<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xs="http://www.w3.org/2001/XMLSchema"
 exclude-result-prefixes="xs"
 version="2.0">

<xsl:template match="number">
  <result>
    <xsl:value-of select="Math:sqrt(xs:double(.))"
                  xmlns:Math="java:java.lang.Math"/>
  </result>
</xsl:template>
  
</xsl:transform>

