<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     
<xsl:attribute-set name="Z" use-attribute-sets="A"/>     
     
<xsl:attribute-set name="A" use-attribute-sets="B C D">
  <xsl:attribute name="x" select="1"/>
  <xsl:attribute name="y" select="2"/>
</xsl:attribute-set>

<xsl:attribute-set name="B" use-attribute-sets="C D">
  <xsl:attribute name="p" select="1"/>
  <xsl:attribute name="q" select="2"/>
</xsl:attribute-set>

<xsl:attribute-set name="C">
  <xsl:attribute name="r" select="5"/>
</xsl:attribute-set>

<xsl:attribute-set name="D" use-attribute-sets="A C">
  <xsl:attribute name="s" select="7"/>
</xsl:attribute-set>

</xsl:stylesheet>

