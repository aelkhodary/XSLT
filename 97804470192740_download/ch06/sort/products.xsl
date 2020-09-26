<products xsl:version="2.0"
       xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:for-each select="products/product">
   <xsl:sort select="sum(region/@sales)" order="descending"/>
   <product name="{@name}" 
            sales="{format-number(sum(region/@sales), '$####0.00')}"/>
</xsl:for-each>
</products>

