<xsl:transform
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:graph="http://wrox.com/569090/graph" 
     xmlns:xs="http://www.w3.org/2001/XMLSchema"
     version="2.0">
     
<xsl:function name="graph:refers" as="xs:boolean">
   <xsl:param name="links" as="node()"/>
   <!-- $links is a node that represents the template to be called -->
   <xsl:param name="A" as="node()"/>
   <xsl:param name="B" as="node()"/>
   <xsl:param name="route" as="node()*"/>

   <!-- find the directly-connected nodes -->
   <xsl:variable name="direct" as="node()*">
      <xsl:apply-templates select="$links">
         <xsl:with-param name="from" select="$A"/>
      </xsl:apply-templates>
   </xsl:variable>

   <!-- return true if B is directly or indirectly connected from A -->
   <xsl:sequence select="exists($direct intersect $B) or
                         (some $C in ($direct except $route) 
                            satisfies graph:refers($links, $C, $B, ($route, $C)))"/> 
</xsl:function>

</xsl:transform>	
