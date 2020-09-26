<xsl:stylesheet 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:f="local-functions.uri"
   exclude-result-prefixes="xs f"
   version="2.0">
   
<xsl:import-schema schema-location="number-list.xsd"/>

<xsl:function name="f:total-numbers" as="xs:decimal*">
   <xsl:param name="input" as="xs:decimal*"/>
   <xsl:param name="total" as="xs:decimal"/>
   <xsl:if test="exists($input)">
      <xsl:variable name="x" as="xs:decimal"
                    select="$input[1] + $total"/>
      <xsl:sequence select="$x"/>
      <xsl:sequence select="f:total-numbers(subsequence($input, 2), $x)"/>
   </xsl:if>
</xsl:function>

<xsl:template match="/">
  <total values="{f:total-numbers(numbers, 0)}"/>
</xsl:template>

</xsl:stylesheet>
