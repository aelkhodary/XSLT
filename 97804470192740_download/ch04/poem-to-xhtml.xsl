<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0" 
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns="http://www.w3.org/1999/xhtml">

<xsl:import-schema namespace="http://www.w3.org/1999/xhtml" 
                   schema-location="http://www.w3.org/2002/08/xhtml/xhtml1-strict.xsd"/>
<xsl:output method="xhtml" indent="yes"/>                   
<xsl:template match="/">
  <xsl:result-document validation="strict">
    <html>
      <head>
        <title><xsl:value-of select="poem/title"/></title>
      </head>
      <body>
        <h1 align="center"><xsl:value-of select="poem/title"/></h1>
        <p align="center"><i>by </i><xsl:value-of select="poem/author/name"/> 
          (<xsl:value-of select="poem/author/(birth,death)" separator="-"/>)</p>
        <xsl:for-each select="poem/stanza">
          <p>
            <xsl:for-each select="line">
              <xsl:value-of select="."/>
              <xsl:if test="position() != last()"><br/></xsl:if>
            </xsl:for-each>
          </p>
        </xsl:for-each>
      </body>
    </html>
  </xsl:result-document>
</xsl:template>                   
</xsl:stylesheet>