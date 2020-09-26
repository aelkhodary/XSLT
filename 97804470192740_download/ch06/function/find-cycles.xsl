<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:xs="http://www.w3.org/2001/XMLSchema"
     xmlns:cyc="http://www.wrox.com/569090/cycles"
     exclude-result-prefixes="xs cyc">
     
<xsl:import-schema namespace="http://www.w3.org/1999/XSL/Transform"
                   schema-location="schema-for-xslt20.xsd"/>
     
<xsl:function name="cyc:direct" as="schema-element(xsl:attribute-set)*">
  <xsl:param name="in" as="schema-element(xsl:attribute-set)"/>
  <xsl:sequence select="$in/../xsl:attribute-set[@name=$in/@use-attribute-sets]"/>
</xsl:function>

<xsl:function name="cyc:references" as="xs:boolean">
  <xsl:param name="A" as="schema-element(xsl:attribute-set)"/>
  <xsl:param name="B" as="schema-element(xsl:attribute-set)"/>
  <xsl:param name="route" as="schema-element(xsl:attribute-set)*"/>
  <xsl:variable name="direct" select="cyc:direct($A)"/>
  <xsl:sequence select="exists($direct intersect $B) or
           (some $C in ($direct except $route) 
                 satisfies cyc:references($C, $B, ($route, $C)))"/>
</xsl:function>


<xsl:template match="/">
  <xsl:variable name="cyclic-attribute-sets" select="/*/xsl:attribute-set[cyc:references(., ., ())]"/>
  <xsl:choose>
  <xsl:when test="empty($cyclic-attribute-sets)">
    <result>No cycles found</result>
  </xsl:when>
  <xsl:otherwise>
    <result cyclic-attribute-sets="{$cyclic-attribute-sets/@name}"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>

