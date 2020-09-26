<xsl:stylesheet 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="xs"
   version="2.0">

<xsl:template name="get-min-and-max" as="document-node()">
  <xsl:param name="nodes" as="node()*"/>
  <xsl:param name="min-so-far" select="number('INF')" as="xs:double"/>
  <xsl:param name="max-so-far" select="number('-INF')" as="xs:double"/>  
  <xsl:choose>
    <xsl:when test="$nodes">
      <xsl:call-template name="get-min-and-max">
        <xsl:with-param name="nodes" select="remove($nodes, 1)"/>
        <xsl:with-param name="min-so-far"
                        select="if (number($nodes[1]) lt $min-so-far) 
                                  then $nodes[1]
                                  else $min-so-far"/>
        <xsl:with-param name="max-so-far"
                        select="if (number($nodes[1]) gt $max-so-far) 
                                  then $nodes[1]
                                  else $max-so-far"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:document>
         <min><xsl:value-of select="$min-so-far"/></min>
         <max><xsl:value-of select="$max-so-far"/></max>
      </xsl:document>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="/">
<result>
  <xsl:call-template name="get-min-and-max">
    <xsl:with-param name="nodes" select="/booklist/book/price"/>
  </xsl:call-template>
</result>
</xsl:template>
   
</xsl:stylesheet>

