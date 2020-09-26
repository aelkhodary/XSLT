<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 11, section "The instance-of Expression / Examples" -->
   
<xsl:output indent="yes"/> 

<xsl:template name="main">
    <output>
      <egA>
        <xsl:variable name="values" select="1 to 10"/>
        <xsl:variable name="nodes" as="element()*">
          <item price="23.00" quantity="3"/>
          <item price="10.00" quantity="5"/>
          <item price="50.00" quantity="1"/>
        </xsl:variable>
        <xsl:variable name="seq" select="$values, $nodes"/>
        <xsl:copy-of select="$seq[. instance of node()]"/>
      </egA>
      <egB>
        <xsl:variable name="values" select="1 to 10"/>
        <xsl:variable name="nodes" as="element()*">
          <item price="23.00" quantity="3"/>
          <item price="10.00" quantity="5"/>
          <item price="50.00" quantity="1"/>
        </xsl:variable>
        <xsl:variable name="seq" select="$values, $nodes"/>
        <xsl:value-of select="if (some $s in $seq
                                   satisfies $s instance of node())
                              then 'there is a node'
                              else 'there is no node'"/>
      </egB>            
      <egC>
        <xsl:variable name="values" select="1 to 10"/>
        <xsl:variable name="nodes" as="element()*">
          <item price="23.00" quantity="3"/>
          <item price="10.00" quantity="5"/>
          <item price="50.00" quantity="1"/>
        </xsl:variable>
        <xsl:variable name="seq" select="$values, $nodes"/>
        <xsl:value-of select="if (not($seq instance of xs:anyAtomicType*))
                              then 'there is a node'
                              else 'there is no node'"/>
      </egC>
      <egD>
        <xsl:variable name="p" select="1 to 10"/>
        <xsl:value-of select="$p instance of item()+"/>
      </egD>    
    </output>
</xsl:template>

<xsl:key name="empname" match="emp" use="@name"/>

</xsl:stylesheet>                                