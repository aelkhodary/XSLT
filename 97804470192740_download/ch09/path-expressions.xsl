<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 9, section "Examples of Path Expressions" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
  <xsl:for-each select="$data/contract">
    <output>
      <eg><xsl:copy-of select="para"/></eg>
      <eg><xsl:value-of select="@title"/></eg>        
      <eg><xsl:copy-of select="book/author/first-name"/></eg>
      <eg><xsl:copy-of select="para[@id]"/></eg>
      <eg><xsl:value-of select="para/@id"/></eg>
      <eg><xsl:copy-of select="$sections/body"/></eg>
      <eg><xsl:copy-of select="$sections[3]/body"/></eg>    
      <eg><xsl:copy-of select="$sections/."/></eg>      
      <eg><xsl:copy-of select="/contract/clause[3]/subclause[2]"/></eg>
      <eg><xsl:copy-of select="//figure"/></eg>
      <eg><xsl:copy-of select="city[not(@name= preceding-sibling::city/@name)]"/></eg>    
      <eg><xsl:value-of select="*/name()"/></eg>            
    </output>
  </xsl:for-each>    
</xsl:template>

<xsl:variable name="sections" select="$data/contract/section"/>

<xsl:variable name="data">
  <contract title="An agreement between you and me">
    <para id="p1">The first paragraph</para>
    <para>The second paragraph</para>
    <section number="1">
      <body>The first section</body>
    </section>
    <section number="2">
      <body>The second section</body>
    </section>
    <section number="3">
      <body>The third section
        <figure src="image.jpg">A pretty picture</figure>
      </body>
    </section>
    <clause>
      The first clause
      <subclause>1.1</subclause>
      <subclause>1.2</subclause>
      <subclause>1.3</subclause>
    </clause>  
    <clause>
      The second clause
      <subclause>2.1</subclause>
      <subclause>2.2</subclause>
      <subclause>2.3</subclause>
    </clause>  
    <clause>
      The third clause
      <subclause>3.1</subclause>
      <subclause>3.2</subclause>
      <subclause>3.3</subclause>
    </clause>
    <book>
      <author>
         <first-name>Agatha</first-name>
         <last-name>Christie</last-name>
      </author>
      <title>And then there were none</title>
    </book>
    <city name="London"/>
    <city name="Berlin"/>
    <city name="London"/>
    <city name="Paris"/>
  </contract>                  
</xsl:variable> 

</xsl:stylesheet>                                