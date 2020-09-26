<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

   <!-- Examples for Chapter 7, section "Function Calls" -->
   
   <!-- This example won't execute unless you are using James Clarks' xt processor
        (and even then it doesn't do anything useful) -->
   

<xsl:template match="/" name="main">
  <output>
    <xsl:variable name="x" select="doc('x.xml')"/>
    <xsl:variable name="y" select="doc('y.xml')"/>
    <a><xsl:value-of select="true()"/></a>
    <b><xsl:value-of select="string-length($x)"/></b>
    <c><xsl:value-of select="count(*)"/></c>
    <d><xsl:value-of select="xt:intersection($x, $y)" xmlns:xt="http://www.jclark.com/xt"/></d>    
  </output>
</xsl:template>

</xsl:stylesheet>                                