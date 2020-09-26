<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 10, section "Examples of filter expressions" -->
   
<xsl:output indent="yes"/>   

<xsl:template name="main">
    <output>
      <egA>
        <xsl:variable name="paragraphs" as="element()*">
          <p>p01</p>
          <p>p02</p>
          <p>p03</p>
          <p>p04</p>
          <p>p05</p>
          <p>p06</p>
          <p>p07</p>
          <p>p08</p>
          <p>p09</p>
          <p>p10</p>
          <p>p11</p>
          <p>p12</p>
          <p>p13</p>
          <p>p14</p>
          <p>p15</p>
          <p>p16</p>
          <p>p17</p>
          <p>p18</p>
          <p>p19</p>
          <p>p20</p>
          <p>p21</p>
          <p>p22</p>
          <p>p23</p>
          <p>p24</p>
          <p>p25</p>
          <p>p26</p>
          <p>p27</p>
          <p>p28</p>
          <p>p29</p>
          <p>p30</p>
        </xsl:variable>
        <xsl:value-of select="$paragraphs[23]"/>  
      </egA>
      <egB>
        <xsl:variable name="staff">
          <emp name="Jane Brown" loc="London"/>
          <emp name="John Smith" loc="New York"/>
          <emp name="Mandy Evans" loc="Cardiff"/>
          <emp name="John Smith" loc="Sydney"/>
          <emp name="Mary White" loc="Johannesburg"/>
        </xsl:variable>
        <xsl:for-each select="$staff">
          <xsl:copy-of select="key('empname', 'John Smith')[@loc='Sydney']"/>
        </xsl:for-each>  
      </egB>
      <egC>
        <xsl:variable name="doc">
          <doc>
            <section>
              <title>Introduction</title>
              <para>This is important</para>
              <subsection>
                <title>Introduction</title>
                <para>You can ignore this</para>
              </subsection>
              <subsection>
                <title>Summary</title>
                <para>Why are you reading this?</para>
              </subsection>
            </section>
          </doc>
        </xsl:variable>
        <xsl:for-each select="$doc">    
          <xsl:copy-of select="(//section|//subsection) [title='Introduction']"/>
        </xsl:for-each>
      </egC>
      <egD>
        <xsl:variable name="index">
          <link href="a.xml"/>
          <link href="b.xml"/>
        </xsl:variable>
        <xsl:copy-of select="($index//@href/doc(.))[pricelist][1]"/>
      </egD>
    </output>
</xsl:template>

<xsl:key name="empname" match="emp" use="@name"/>

</xsl:stylesheet>                                