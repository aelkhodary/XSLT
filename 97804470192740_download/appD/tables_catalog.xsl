<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

 <xsl:template match="/">
  <html>
   <head>
    <title>Three Real Tables</title>
    <style type="text/css">
     .tname {font-family:Tahoma;font-size:14pt;font-weight:bold}
     .tdesc {font-family:Tahoma;font-size:10pt}
     .tsaletxt {font-family:Tahoma;font-size:14pt;font-weight:bold;color:gray;}
     .tprice {font-family:Tahoma;font-size:18pt;font-weight:bold;color:red;text-align:center}
    </style>
   </head>
   <body>
     <xsl:apply-templates select="/tables/table">
       <xsl:sort select="table-name"/>
     </xsl:apply-templates>
   </body>
  </html>
 </xsl:template>

 <xsl:template match="table">
  <table border="0" cellpadding="10" bgcolor="lightyellow">
   <tr>
    <td>
     <img src="{table-name}.gif" alt="The {table-name} Table"/>
    </td>
    <td>
     <div class="tname">
      The '<xsl:value-of select="table-name"/>' Table
     </div><p/>
     <div class="tdesc">
      A useful <xsl:value-of select="number-of-legs"/>-leg
      <xsl:value-of select="table-shape"/> table with easy<br/>to clean
      <xsl:value-of select="table-top-material" />-effect
      <xsl:value-of select="table-top-material/@type"/> top.
     </div><p/>
     <div class="tsaletxt">
      OUR SALE PRICE ONLY
     </div>
     <xsl:apply-templates select="retail-price"/>
    </td>
   </tr>
  </table><p/>
 </xsl:template>

 <xsl:template match="retail-price">
  <div class="tprice">
    <xsl:choose>
     <xsl:when test="@currency = 'USD'">$ </xsl:when>
     <xsl:when test="@currency = 'GBP'">£ </xsl:when>
     <xsl:when test="@currency = 'EURO'">E </xsl:when>
     <xsl:when test="@currency = 'YEN'">Y </xsl:when>
    </xsl:choose>
   <xsl:value-of select="format-number(., '#,##0.00')"/>
  </div>
 </xsl:template>

</xsl:stylesheet>
