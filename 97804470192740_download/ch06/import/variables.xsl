<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:acme="http://acme.com/xslt"
    exclude-result-prefixes="acme">

<xsl:import href="boilerplate.xsl"/>
<xsl:output encoding="iso-8859-1" indent="yes"/>

<xsl:variable name="acme:company-name" select="'Acme Widgets Limited'"/>

<xsl:template match="/">
<c><xsl:value-of select="$acme:copyright"/></c>
</xsl:template>

</xsl:stylesheet>


