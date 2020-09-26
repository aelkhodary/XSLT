<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

   <!-- Examples for Chapter 10, section "Quantified Expressions / Examples" -->
   
<xsl:output indent="yes"/> 

<xsl:template name="main">
    <output>
      <egA>
        <xsl:variable name="order">
          <item price="23.00" quantity="3"/>
          <item price="10.00" quantity="5"/>
          <item price="50.00" quantity="1"/>
        </xsl:variable>
        <xsl:for-each select="$order">
          <xsl:value-of select="some $i in //item satisfies $i/price gt 200"/> 
        </xsl:for-each> 
      </egA>
      <egB>
        <xsl:variable name="S" select="1, 4, 7, 9, 2, 2, 6, 8"/>
        <xsl:value-of select="some $n in 1 to count($S)-1 satisfies $S[$n] eq $S[$n+1]"/>
      </egB>
      <egC>
        <xsl:variable name="people">
          <person dob="1951-10-11"/>
          <person dob="1987-12-13"/>
          <person dob="1954-01-24"/>
          <person dob="1900-02-29"/>
        </xsl:variable>
        <xsl:for-each select="$people">    
          <xsl:value-of select="every $p in //person satisfies $p/@dob castable as xs:date"/>
        </xsl:for-each>
      </egC>
      <egD>
        <xsl:variable name="doc">
          <keyword>croquet</keyword>
          <keyword>roquet</keyword>
          <keyword>hoop</keyword>
          <keyword>mallet</keyword>
          <keyword>bisque</keyword>
          <rules>
            <para>In Association Croquet one player (or in doubles, one team) takes the black and blue balls,
             the other takes red and yellow.</para>
            <para>On each turn, the player can choose to play either of his balls, and must continue to play
             that ball for the rest of the turn. The turn continues provided he or she either a) hits the ball
             through the correct hoop ("runs" a hoop), or b) hits another ball (a "roquet").</para>
            <para>Upon hitting another ball, the player must play their next shot with the two balls touching: 
            this is the "croquet stroke" from which the game takes its name.</para>
          </rules> 
        </xsl:variable>
        <xsl:for-each select="$doc">
          <xsl:value-of select="some $k in //keyword, $p in //para satisfies contains($p, $k)"/>
        </xsl:for-each>
      </egD>   
      <egE>
        <xsl:variable name="doc">
          <termdef id="croquet">A game played with mallets, hoops and balls; a stroke played withe two balls in contact.</termdef>
          <termdef id="roquet">A stroke played in <termref def="croquet"/> in which the ball in play strikes another ball.</termdef>
          <termdef id="hoop">In croquet (also called a wicket); a metal gate through which balls must pass.</termdef>
          <rules>
            <para>In Association Croquet one player (or in doubles, one team) takes the black and blue balls,
             the other takes red and yellow.</para>
            <para>On each turn, the player can choose to play either of his balls, and must continue to play
             that ball for the rest of the turn. The turn continues provided he or she either a) hits the ball
             through the correct <termref def="hoop"/> ("runs" a hoop), or b) hits another ball (a "<termref def="roquet"/>).</para>
            <para>Upon hitting another ball, the player must play their next shot with the two balls touching: 
            this is the "<termref def="croquet"/> stroke" from which the game takes its name.</para>
          </rules> 
        </xsl:variable>
        <xsl:for-each select="$doc">
          <xsl:value-of select="every $d in //termdef/@id satisfies some $r in //termref satisfies $d eq $r/@def"/>
        </xsl:for-each>
      </egE>    
    </output>
</xsl:template>

<xsl:key name="empname" match="emp" use="@name"/>

</xsl:stylesheet>                                