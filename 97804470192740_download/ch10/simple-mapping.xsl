<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 10, section "Examples of simple mapping expressions" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
    <output>
      <egA>
        <xsl:variable name="order">
          <order price="23.00" quantity="3"/>
          <order price="10.00" quantity="5"/>
          <order price="50.00" quantity="1"/>
        </xsl:variable>
        <xsl:for-each select="$order">
          <xsl:value-of select="sum(order/(@price*@quantity))"/> 
        </xsl:for-each> 
      </egA>
      <egB>
        <xsl:for-each select="(doc('../othello.xml')//SPEAKER[.='BIANCA'])[1]">
          <xsl:value-of select="string-join(ancestor::*/name(), '/')"/>
        </xsl:for-each>  
      </egB>
      <egC>
        <xsl:variable name="order">
          <product price="$15.00" quantity="3"/>
          <product price="$10.00" quantity="5"/>
          <product price="$50.00" quantity="1"/>
        </xsl:variable>
        <xsl:for-each select="$order">    
          <xsl:value-of select="avg(product/number(substring-after(@price, '$')))"/>
        </xsl:for-each>
      </egC>
    </output>
</xsl:template>

<xsl:key name="empname" match="emp" use="@name"/>

</xsl:stylesheet>                                