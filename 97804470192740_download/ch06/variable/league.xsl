<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>

<xsl:variable name="teams" select="distinct-values(//team)"/>
<xsl:variable name="matches" select="//match"/>

<xsl:template match="results">
<league>
  <xsl:for-each select="$teams">
     <xsl:variable name="this" select="."/>
     <xsl:variable name="played" select="count($matches[team=$this])"/>
     <xsl:variable name="won" 
          select="count($matches[team[.=$this]/@score &gt; team[.!=$this]/@score])"/>
     <xsl:variable name="lost"
          select="count($matches[team[.=$this]/@score &lt; team[.!=$this]/@score])"/>
     <xsl:variable name="drawn"
          select="count($matches[team[.=$this]/@score = team[.!=$this]/@score])"/>
     <xsl:variable name="for"
          select="sum($matches/team[.=current()]/@score)"/>
     <xsl:variable name="against"
          select="sum($matches[team=current()]/team/@score) - $for"/>

     <team name="{.}" played="{$played}" won="{$won}" drawn="{$drawn}"
          lost="{$lost}" for="{$for}" against="{$against}"/>

  </xsl:for-each>
</league>
</xsl:template>

</xsl:transform>
