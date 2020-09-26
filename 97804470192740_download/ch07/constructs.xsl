<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

   <!-- Examples for Chapter 7, basic constructs -->
   

<xsl:template match="item">
  <output>
    <Expr><xsl:value-of select="1 to 3, 5, 7, 11, 13"/></Expr>
    <ForExpr><xsl:value-of select="for $i in 1 to 10 return $i*$i"/></ForExpr>
    <QuantifiedExpr><xsl:value-of select="some $i in //item satisfies exists($i/*)"/></QuantifiedExpr>
    <IfExpr><xsl:value-of select="if (exists(@price)) then @price else 0"/></IfExpr>
    <OrExpr><xsl:value-of select="@price &gt; 3 or @cost &lt; 2"/></OrExpr>        
  </output>
</xsl:template>

<xsl:template name="main">
  <xsl:variable name="data">
    <data>
      <item price="30.00" cost="12.50"/>
      <item price="25.00" cost="8.50"/>
      <item price="16.00" cost="5.50"/>
    </data>
  </xsl:variable>
  <xsl:apply-templates select="$data/data/item"/>
</xsl:template>              

</xsl:stylesheet>                   

             