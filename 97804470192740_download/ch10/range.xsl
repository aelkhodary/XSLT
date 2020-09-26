<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 10, section "Examples of range expressions" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
    <output>
      <egA>
        <xsl:variable name="seq" select="'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'"/>
        <xsl:value-of select="for $n in 1 to 10 return $seq[$n]"/>
      </egA>
      <egB>
        <xsl:variable name="seq" select="'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'"/>
        <xsl:value-of select="$seq[position() = 1 to 10]"/>
      </egB>
      <egC>
        <xsl:variable name="N" select="8"/>
        <xsl:value-of select="string-join(for $i in 1 to $N return '_', '')"/>
      </egC>
      <egD>
        <xsl:value-of select="for $i in 1 to 5 return $i*2"/>
      </egD>
      <egD>
        <xsl:variable name="S" select="'a', 'b', 'c', 'd'"/>
        <xsl:variable name="T" select="'p', 'q', 'r', 's'"/>
        <xsl:value-of select="for $i in 1 to count($S) return concat($S[$i], $T[$i])"/>
      </egD>            
      <egE>
        <xsl:for-each select="1 to 5">
         <br/>
        </xsl:for-each>
      </egE>
    </output>
</xsl:template>

</xsl:stylesheet>                                