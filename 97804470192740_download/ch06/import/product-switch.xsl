<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
 
<xsl:import href="product-switch-altova.xsl"
     use-when="system-property('xsl:product-name') = 'Altova XSLT Engine'"/>
     
<xsl:import href="product-switch-gestalt.xsl"
     use-when="system-property('xsl:product-name') = 'Gestalt'"/>    
     
<xsl:import href="product-switch-saxon.xsl"
     use-when="system-property('xsl:product-name') = 'SAXON'"/>   
     
<xsl:template match="/">
  <out>
    <xsl:call-template name="show-product"/>
  </out>
</xsl:template>

</xsl:stylesheet>