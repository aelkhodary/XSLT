<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 9, section "Examples of axis steps" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
  <xsl:for-each select="$data//item">
    <output>
      <egA><xsl:value-of select="child::title"/></egA>
      <egB><xsl:value-of select="title"/></egB>
      <egC><xsl:value-of select="attribute::title"/></egC>
      <egD><xsl:value-of select="@title"/></egD>
      <egE><xsl:value-of select="ancestor::xyz:*" xmlns:xyz="http://test-data/"/></egE>
      <egF><xsl:value-of select="*[@width]"/></egF>
      <egG><xsl:value-of select="text()[starts-with(.,'The')]"/></egG>
      <egH><xsl:value-of select="*[@code][position() &lt; 10]"/></egH>
      <egI><xsl:value-of select="*[position() &lt; 10][@code]"/></egI>
      <egJ><xsl:value-of select="self::*[not(@code = preceding-sibling::*/@code)]"/></egJ>
      <egK><xsl:value-of select="namespace::*"/></egK>
      <egL><xsl:value-of select="self::item"/></egL>
      <egM><xsl:value-of select="comment()"/></egM>
      <egN><xsl:value-of select="@comment()"/></egN>
    </output>
  </xsl:for-each>    
</xsl:template>

<xsl:variable name="chap" select="$data/data/book/chapter[1]"/>

<xsl:variable name="data">
  <data xmlns:zyx="http://test-data/">
    <zyx:root>
      <dummy code="Z012"/>
      <item title="attribute-title" code="Z123">
        <title>element-title</title>
        <xsl:comment>this is a comment</xsl:comment>
        <xsl:text>The cat sat on the mat</xsl:text>
        <subitem code="kkk">kkk</subitem>
        <subitem code="lll">lll</subitem>
        <subitem code="mmm" width="50%">mmm</subitem>
        <subitem code="nnn">nnn</subitem>
      </item>
    </zyx:root>  
  </data>                  
</xsl:variable> 

</xsl:stylesheet>                                