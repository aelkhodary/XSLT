<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xs="http://www.w3.org/2001/XMLSchema"
 xmlns:local="local-functions.uri"
 exclude-result-prefixes="xs local"
 version="2.0"
>

<xsl:output method="xml" indent="yes"/>

<xsl:variable name="speakers" as="xs:string*"
              select="for $w in distinct-values(//SPEAKER)
                      return upper-case($w)"/>
              
<xsl:function name="local:split" as="xs:string*">
  <xsl:param name="line" as="xs:string"/>
  <xsl:sequence select="tokenize($line, '\W')"/>
</xsl:function>

<xsl:function name="local:is-character" as="xs:boolean">
  <xsl:param name="word" as="xs:string"/>
  <xsl:sequence select="upper-case($word)=$speakers"/>
</xsl:function>

<xsl:template name="scan-line">
   <xsl:param name="words" as="xs:string*"/>
   <xsl:if test="count($words) ge 3">
     <xsl:if test="local:is-character($words[1]) and
                   lower-case($words[2]) = 'and' and
                   local:is-character($words[3])">
       <hit>
         <xsl:value-of select="$words[position() = 1 to 3]" separator=" "/>
       </hit>
     </xsl:if>
     <xsl:call-template name="scan-line">
        <xsl:with-param name="words" 
                        select="$words[position() gt 1]"/>
     </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template match="/">
<naming-lines>
<xsl:for-each select="//LINE">
   <xsl:call-template name="scan-line">
      <xsl:with-param name="words" select="local:split(.)"/>
   </xsl:call-template>
</xsl:for-each>
</naming-lines>
</xsl:template>

</xsl:transform>

