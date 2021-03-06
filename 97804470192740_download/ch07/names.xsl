<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

   <!-- Examples for Chapter 7, names and variables -->
   

<xsl:template name="main">
  <xsl:variable name="A" select="1"/>
  <xsl:variable name="alpha" select="1"/>
  <xsl:variable name="π" select="1"/>
  <xsl:variable name="א" select="1"/>
  <xsl:variable name="ΕΛΛΑΣ" select="1"/>
  <xsl:variable name="_system-id" select="1"/>
  <xsl:variable name="Iso-8859-1" select="1"/>
  <xsl:variable name="Billing.address" select="1"/>
  <xsl:variable name="Straßüberführung " select="1"/>
  <xsl:variable name="_..._---_..._" select="1"/>
  <xsl:value-of select="$A + $ (: comment here :) alpha + $π + $א + $_system-id + $Iso-8859-1 + 
                      $Billing.address + $Straßüberführung + $_..._---_..._"/>                   
</xsl:template>     
      

</xsl:stylesheet>                   

             