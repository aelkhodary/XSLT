<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 8, section "Boolean Expressions" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
  <xsl:for-each select="$data/data">
    <output>
      <eg><xsl:value-of select="$x > 3 and $x &lt; 8"/></eg>
      <eg><xsl:value-of select="@name and @address"/></eg>        
      <eg><xsl:value-of select="string(@name) and string(@address)"/></eg>
      <eg><xsl:value-of select="true()"/></eg>
      <eg><xsl:value-of select="$x = 5 or $x = 10"/></eg>
      <eg><xsl:value-of select="@name or @id"/></eg>
      <eg><xsl:value-of select="not(@id) or @id=''"/></eg>    
      <eg><xsl:value-of select="//para[position()=1 or position()=last()]"/></eg>      
    </output>
  </xsl:for-each>    
</xsl:template>

<xsl:variable name="x" select="3.5"/>
<xsl:variable name="y" select="1 to 5"/>
<xsl:variable name="data">
  <data name="Kay" address=""/>
  <data type="Adler" id="A82"/>
</xsl:variable> 

</xsl:stylesheet>                                