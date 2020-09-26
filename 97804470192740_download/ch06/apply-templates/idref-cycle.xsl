<xsl:transform
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:graph="http://wrox.com/569090/graph"
     version="2.0">
     
<xsl:import href="cycle.xsl"/>
     
<xsl:variable name="graph:idref-links" as="element()">
      <graph:idref-link/>
</xsl:variable>

<xsl:template match="graph:idref-link" as="node()*">
   <xsl:param name="from" required="yes" as="node()"/>
   <xsl:sequence select="$from/id($from/@idref)"/>
</xsl:template>

<xsl:template name="check-context-node">
  <xsl:if test="graph:refers($graph:idref-links, ., ., ())">
    <xsl:message terminate="yes">Cycle detected for <xsl:value-of select="@id"/>!</xsl:message>
  </xsl:if>
</xsl:template>

<xsl:template match="/">
  <testing>
  <xsl:for-each select="//part">
    <testing part="{@id}"/>
    <xsl:call-template name="check-context-node"/>
  </xsl:for-each>
  </testing>
</xsl:template>

</xsl:transform>	
