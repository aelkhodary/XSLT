<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
	xmlns:extra="urn:extra-functions" 
>
<msxsl:script xmlns:msxsl="urn:schemas-microsoft-com:xslt"
        language="VBScript"
        implements-prefix="extra"
>

Function ToMillimetres(inches)
   ToMillimetres = inches * 25.4
End Function

</msxsl:script>

<xsl:output method="html"/>

<xsl:template match="/" >
<html><body><p>
   <xsl:apply-templates/>
</p></body></html>
</xsl:template>

<xsl:template match="inches">
   <xsl:text> </xsl:text>
   <xsl:value-of select="format-number(extra:ToMillimetres(number(.)),
                         '0.00')"/>
   <xsl:text>mm</xsl:text>
</xsl:template>

</xsl:stylesheet>
