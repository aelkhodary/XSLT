<xsl:stylesheet 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="xs"
   version="2.0">
   
<!-- This is a "divide and conquer" version of the minimax.xsl stylesheet. It is not actually
       included in the book, for reasons of space -->   

<xsl:template name="get-min-and-max">
  <xsl:param name="nodes" as="node()*"/>
  <xsl:param name="min-so-far" select="number('INF')" as="xs:double"/>
  <xsl:param name="max-so-far" select="number('-INF')" as="xs:double"/>  
  <xsl:choose>
    <xsl:when test="count($nodes) gt 1">
      <xsl:variable name="first">
        <xsl:call-template name="get-min-and-max">
          <xsl:with-param name="nodes" select="subsequence($nodes, 1, count($nodes) idiv 2)"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="second">
        <xsl:call-template name="get-min-and-max">
          <xsl:with-param name="nodes" select="subsequence($nodes, (count($nodes) idiv 2) + 1)"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:document>
         <min><xsl:value-of select="if(number($first/min) lt number($second/min))
                                    then $first/min
                                    else $second/min"/></min>
         <max><xsl:value-of select="if(number($first/max) gt number($second/max))
                                    then $first/max
                                    else $second/max"/></max>
      </xsl:document>
    </xsl:when>
    <xsl:when test="count($nodes) eq 1">
      <xsl:document>
         <min><xsl:value-of select="$nodes[1]"/></min>
         <max><xsl:value-of select="$nodes[1]"/></max>
      </xsl:document>
    </xsl:when>
    <xsl:otherwise>
      <xsl:document>
         <min>INF</min>
         <max>-INF</max>
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

