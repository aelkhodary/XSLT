<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="review/event/artist"/></title>
    <style>
      body {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 10pt;
        font-style:normal;
        color: #3D5B96;
        line-height: 14pt;
      }
	  </style>		
  </head>
  <body>
    <xsl:apply-templates/>
  </body>
</html>
</xsl:template>

<xsl:template match="event">
<h1>
  <xsl:value-of select="artist, venue, format-date(date, '[D] [MNn,3] [Y]')" separator=" - "/>
</h1>
</xsl:template>  

<xsl:template match="para">
   <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="para/*">
   <xsl:apply-templates/>
</xsl:template>

<xsl:template match="para/work" priority="2">
   <i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="byline">
   <p style="font-weight: bold; font-style:italic">
     <xsl:value-of select="author, publication, date" separator=", "/>
   </p>
</xsl:template>

</xsl:stylesheet>

