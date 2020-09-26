<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

   <!-- Examples for Chapter 7, section "Expressions" -->
   
<xsl:output indent="yes"/>   
   
<xsl:variable name="data">
  <data>
    <book title="Swallows and Amazons">
      <author>Arthur Ransome</author>
      <chapter>
        Chapter 1
      </chapter>
      <chapter>
        Chapter 2
      </chapter>      
    </book>
    <book title="The Eyre Affair">
      <author>Jasper Fforde</author>
      <chapter>
        Chapter 1
      </chapter>
      <chapter>
        Chapter 2
      </chapter>      
    </book>
    <magazine title="Hello!">
      <article>
        Article 1
      </article>
      <article>
        Article 1
      </article>      
    </magazine>
    <product>
      <price>12.00</price>
      <quantity>2</quantity>
    </product>  
    <product>
      <price>15.00</price>
      <quantity>5</quantity>
    </product>        
  </data>
</xsl:variable>

<xsl:template name="example-1">
  <example-1>
    <xsl:variable name="x" select="5"/>
    <xsl:variable name="y" select="7"/>
    <xsl:value-of select="$x + $y * 2"/>
  </example-1>
</xsl:template>  

<xsl:template name="example-2">
  <example-2>
    <xsl:copy-of select="//book | //magazine"/>
  </example-2>
</xsl:template>  

<xsl:template name="example-4">
  <example-4>
    <xsl:for-each select="//book">
      <out><xsl:value-of select="substring-before(author, ' ')"/></out>
    </xsl:for-each>  
  </example-4>
</xsl:template>

<xsl:template name="example-5">
  <example-5>
    <xsl:for-each select="//book">
      <out><xsl:if test="chapter and verse">found</xsl:if></out>
    </xsl:for-each>  
  </example-5>
</xsl:template>

<xsl:template name="example-6">
  <example-6>
    <xsl:value-of select="sum(//product/(price * quantity))"/>
  </example-6>
</xsl:template>

<xsl:template name="example-7">
  <example-7>
    <xsl:value-of select="avg(((//product)[position() le 5])/price)"/>
  </example-7>
</xsl:template>

<xsl:template name="main">
  <output>
    <xsl:for-each select="$data">
      <xsl:call-template name="example-1"/>
      <xsl:call-template name="example-2"/>
      <xsl:call-template name="example-4"/>
      <xsl:call-template name="example-5"/>
      <xsl:call-template name="example-6"/>
      <xsl:call-template name="example-7"/>      
    </xsl:for-each>
  </output>
</xsl:template>

</xsl:stylesheet>                                