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
     <table border="0" cellpadding="10">
      <tr>
       <th align="left">Name</th>
       <th align="left">Shape</th>
       <th align="left">Legs</th>
       <th align="left">Material</th>
       <th align="left">Finish</th>
       <th align="left">Price</th>
      </tr>
      <xsl:apply-templates select="/tables/table">
       <xsl:sort select="table-name"/>
      </xsl:apply-templates>
    </table><p />
   </body>
  </html>
 </xsl:template>

 <xsl:template match="table">
   <tr>
    <td><xsl:value-of select="table-name"/></td>
    <td><xsl:value-of select="table-shape"/></td>
    <td><xsl:value-of select="number-of-legs"/></td>
    <td><xsl:value-of select="table-top-material/@type" /></td>
    <td><xsl:value-of select="table-top-material"/></td>
    <td><xsl:apply-templates select="retail-price"/></td>
   </tr>
 </xsl:template>

 <xsl:template match="retail-price">
  <div class="tprice">
    <xsl:choose>
     <xsl:when test="@currency = 'USD'">$ </xsl:when>
     <xsl:when test="@currency = 'GBP'">£ </xsl:when>
     <xsl:when test="@currency = 'EURO'">C </xsl:when>
     <xsl:when test="@currency = 'YEN'">Y </xsl:when>
    </xsl:choose>
   <xsl:value-of select="format-number(., '#,##0.00')"/>
  </div>
 </xsl:template>

</xsl:stylesheet>
