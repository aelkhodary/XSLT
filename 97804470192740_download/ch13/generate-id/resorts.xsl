

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: format-number --> 

<html xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:version="2.0">
<body>
	<h1>Hotels</h1>
	<xsl:for-each select="//hotel">
	<xsl:sort select="number(stars)" order="descending" data-type="number"/>
		<h2><xsl:value-of select="name"/></h2>
		<p>Address: <xsl:value-of select="address"/></p>
		<p>Stars: <xsl:value-of select="stars"/></p>
		<p>Resort: <a href="#{generate-id(parent::resort)}">
			<xsl:value-of select="parent::resort/name"/></a></p>   
	</xsl:for-each>
	<h1>Resorts</h1>
	<xsl:for-each select="//resort">
		<h2><a name="{generate-id()}"><xsl:value-of select="name"/></a></h2>
		<p><xsl:value-of select="details"/></p>
	</xsl:for-each>
</body>
</html>