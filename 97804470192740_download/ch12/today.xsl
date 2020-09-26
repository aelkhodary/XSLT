<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet	version="2.0"
	  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs">

<xsl:import href="itinerary.xsl"/>
   
<xsl:param name="highlight-day" as="xs:integer" required="yes"/>

<xsl:key name="day-number" match="day" use="xs:integer(@number)"/>

<xsl:template match="key('day-number', $highlight-day)//text()">
    <font color="red"><xsl:value-of select="."/></font>
</xsl:template>

</xsl:stylesheet>

