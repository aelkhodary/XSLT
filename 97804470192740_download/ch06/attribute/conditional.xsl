<xsl:stylesheet version="2.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      
      <!-- Stylesheet conditional.xsl - demonstrate use of xsl:attribute -->

<xsl:param name="schema-version" select="4.0"/>

<xsl:template name="main">
<promotion>
   <xsl:variable name="attname"
       select="if ($schema-version lt 3.0) 
               then 'code' 
               else 'reason-code'"/>
   <xsl:attribute name="{$attname}" select="17"/>
</promotion>

</xsl:template>
</xsl:stylesheet>

