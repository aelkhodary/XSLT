<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 9, section "Examples of positional predicates" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
  <xsl:for-each select="$data">
    <output>
      <egA><xsl:value-of select="para[1]"/></egA>
      <egB><xsl:value-of select="para[last()]"/></egB>
      <egC><xsl:value-of select="para[position()!=1]"/></egC>
      <egD><xsl:value-of select="para[position()=1 to 5]"/></egD>
      <egE><xsl:value-of select="para[last()-1]"/></egE>
      <egF><xsl:value-of select="para[3.2]"/></egF>
      <egG><xsl:value-of select="para[position()]"/></egG>
      <egH><xsl:value-of select="para[position()-1]"/></egH>
      <egI><xsl:value-of select="para[number(@nr)]"/></egI>
    </output>
  </xsl:for-each>    
</xsl:template>

<xsl:variable name="chap" select="$data/data/book/chapter[1]"/>

<xsl:variable name="data">
  <para>p1</para>
  <para>p2</para>
  <para nr="3">p3</para>
  <para nr="5">p4</para>
  <para>p5</para>
  <para>p6</para>
  <para>p7</para>      
</xsl:variable> 

</xsl:stylesheet>                                