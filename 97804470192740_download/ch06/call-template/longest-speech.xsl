<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xs="http://www.w3.org/2001/XMLSchema"
 exclude-result-prefixes="xs"
 version="2.0"
>
<xsl:template name="longest-speech" as="element(SPEECH)?">
<xsl:param name="list" as="element(SPEECH)*"/>
  <xsl:choose>
  <xsl:when test="$list">
    <xsl:variable name="first" select="count($list[1]/LINE)" as="xs:integer"/>
    <xsl:variable name="longest-of-rest" as="element(SPEECH)?">
      <xsl:call-template name="longest-speech">
         <xsl:with-param name="list"
                         select="$list[position()!=1]"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
    <xsl:when test="$first gt count($longest-of-rest/LINE)">
      <xsl:sequence select="$list[1]"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="$longest-of-rest"/>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="/">
  <longest-speech>
    <xsl:call-template name="longest-speech">
      <xsl:with-param name="list" select="//SPEECH"/>
   </xsl:call-template>
  </longest-speech>  
</xsl:template>

</xsl:transform>

