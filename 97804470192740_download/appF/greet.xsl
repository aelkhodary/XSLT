<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://saxon.sf.net/"
                version="2.0">

<!-- to be used with calls.xml -->

<xsl:param name="greeting" required="yes"/>
 
<xsl:template match="/">
  <html>
    <head>
      <title>Account for period ending 
           <xsl:value-of select="(//@date)[last()]"/></title>
    </head>
    <body>
      <h1><xsl:value-of select="$greeting"/></h1>
      <h1>Account for period ending 
           <xsl:value-of select="(//@date)[last()]"/></h1>
      <xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<xsl:template match="calls">
   <table>
      <tr>
        <th width="100">Date</th>
        <th width="100">Time</th>
        <th width="100">Duration</th>
      </tr>    
      <xsl:apply-templates/>
   </table>
</xsl:template>

<xsl:template match="call">
   <tr>
     <td><xsl:value-of select="@date"/></td> 
     <td><xsl:value-of select="@time"/></td> 
     <td><xsl:value-of select="@duration"/></td> 
   </tr>
</xsl:template>

</xsl:stylesheet>

