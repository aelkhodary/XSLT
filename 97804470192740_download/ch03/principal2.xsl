<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet 
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      version="1.0"
>
<xsl:import href="copyright.xsl"/>
<xsl:variable name="owner">John Wiley Inc.</xsl:variable>
<xsl:include href="date.xsl"/>

<xsl:output method="xml" encoding="iso-8859-1" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:template match="date">
   <date><xsl:value-of select="$date"/></date>
</xsl:template>
<xsl:template match="copyright">
   <copyright><xsl:call-template name="copyright"/></copyright>
</xsl:template>

<xsl:template match="*">
   <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
   </xsl:copy>
</xsl:template>

</xsl:stylesheet>
