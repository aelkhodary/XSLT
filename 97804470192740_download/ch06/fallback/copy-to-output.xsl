<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>
<xsl:output indent="yes"/>

<xsl:template name="boilerplate" version="6.1">    
   <div id="boilerplate">
      <xsl:copy-to-output href="boilerplate.xhtml">
         <xsl:fallback>
            <xsl:copy-of select="document('boilerplate.xhtml')"/>
         </xsl:fallback>
      </xsl:copy-to-output>
   </div>
</xsl:template>

</xsl:transform>

