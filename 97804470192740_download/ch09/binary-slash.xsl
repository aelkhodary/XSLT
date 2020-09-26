<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 9, section "Examples of the binary '/' operator" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
  <xsl:for-each select="$data/data">
    <output>
      <eg><xsl:value-of select="descendant::para/@style"/></eg>
      <eg><xsl:copy-of select="section[1]/clause[3]"/></eg>
      <eg><xsl:copy-of select="doc('a.xml')/id('Z123')"/></eg>
      <eg><xsl:copy-of select="book/(chapter|appendix)"/></eg>
      <eg><xsl:copy-of select="$chap/title"/></eg>
    </output>
  </xsl:for-each>    
</xsl:template>

<xsl:variable name="chap" select="$data/data/book/chapter[1]"/>

<xsl:variable name="data">
  <data>
    <para id="p1" style="one">The first paragraph</para>
    <para style="two">The second paragraph</para>
    <section number="1">
      <body>The first section</body>
      <clause>one</clause>
      <clause>two</clause>
      <clause>three</clause>      
    </section>
    <section number="2">
      <body>The second section</body>
    </section>
    <section number="3">
      <body>The third section
        <figure src="image.jpg">A pretty picture</figure>
      </body>
    </section>
    <book>
      <author>
         <first-name>Agatha</first-name>
         <last-name>Christie</last-name>
      </author>
      <title>And then there were none</title>
      <chapter>
        <title>The first chapter</title>
        <section>
          <para style="one"><sentence>The first section of the first chapter, para one</sentence></para>
          <para style="one"><sentence>The first section of the first chapter, para two</sentence></para>
        </section>
      </chapter>
    </book>
  </data>                  
</xsl:variable> 

</xsl:stylesheet>                                