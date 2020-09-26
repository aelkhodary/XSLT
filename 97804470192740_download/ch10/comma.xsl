<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 10, section "Examples of comma operator" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
    <output>
      <egA>
        <xsl:variable name="net" select="15.00"/>
        <xsl:variable name="gross" select="22.00"/>
        <xsl:value-of select="max(($net, $gross))"/>
      </egA>
      <egB>
        <xsl:variable name="seq" select="'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'"/>
        <xsl:value-of select="for $i in (1 to 4, 8, 13) return $seq[$i]"/>
      </egB>
      <egC>
        <xsl:variable name="e" as="element()">
          <e a='alex' b='betty' c='carlos'/>
        </xsl:variable>
        <xsl:value-of select="$e/string-join((@a, @b, @c), '-')"/>
      </egC>
      <egD>
        <xsl:variable name="e" as="element()">
          <e a='alex' b='betty' c='carlos'/>
        </xsl:variable>
        <xsl:value-of select="$e/(@code, 'N/A')[1]"/>
      </egD>
      <egD>
        <xsl:variable name="e">
          <book>
            <author>Michael Kay</author>
            <title>XSLT Programmers Reference</title>
            <isbn>0-764-56909-0</isbn>
          </book>  
        </xsl:variable>
        <xsl:value-of select="$e/book/(author, title, isbn)"/>
      </egD>            
      <egE>
        <xsl:variable name="e">
          <first>Michael</first>
          <middle>Howard</middle>
          <last>Kay</last>
        </xsl:variable>      
        <xsl:for-each select="$e">
          <xsl:value-of select="first, middle, last"/>
        </xsl:for-each>
      </egE>
    </output>
</xsl:template>

</xsl:stylesheet>                                