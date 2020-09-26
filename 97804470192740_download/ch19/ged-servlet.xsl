<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>

<xsl:import href="person.xsl"/>
<xsl:param name="tree"/>

<xsl:template name="make-href">
	<xsl:value-of select="'GedServlet?tree=', $tree, '&amp;id=', ../@Id"
	              separator=""/>
</xsl:template>

</xsl:transform>
