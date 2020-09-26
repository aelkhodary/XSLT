<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
  <head>
		<title>Itinerary</title>
  </head>
  <body><center>
		<xsl:apply-templates select="//day"/>
  </center></body>
</html>
</xsl:template>

<xsl:template match="day">
    <h3>Day <xsl:value-of select="@number"/></h3>
    <p><xsl:apply-templates/></p>
</xsl:template>
</xsl:stylesheet>

