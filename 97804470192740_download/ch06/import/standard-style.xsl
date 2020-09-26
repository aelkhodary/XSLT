<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     
<xsl:output indent="yes"/>     

<xsl:template match="/">
 <html>
   <head>
     <title><xsl:value-of select="//title"/></title>
   </head>
   <body>
     <xsl:apply-templates/>
   </body>
 </html>
</xsl:template>

<xsl:template match="title">
   <h1><xsl:apply-templates/></h1>
</xsl:template>

<xsl:template match="author">
   <div align="right"><i>by </i>
      <xsl:apply-templates/>
   </div>
</xsl:template>

<xsl:template match="stanza">
   <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="line">
   <xsl:apply-templates/><br/>
</xsl:template>

<xsl:template match="date"/>
</xsl:stylesheet>

