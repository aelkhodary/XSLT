<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0" 
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xpath-default-namespace="http://poetry.org/ns"
      exclude-result-prefixes="xs">

<xsl:import-schema namespace="http://poetry.org/ns" 
                   schema-location="poem.xsd"/>
<xsl:output method="html" indent="yes"/>                   

<xsl:template match="/">
  <xsl:message terminate="yes">Input must be a validated poem</xsl:message>
</xsl:template>

<xsl:template match="document-node(schema-element(poem))">
    <html>
      <head>
        <title><xsl:value-of select="poem/title"/></title>
      </head>
      <body>
        <h1><xsl:value-of select="poem/title"/></h1>
        <p><i>by </i><xsl:value-of select="poem/author/name"/> 
          (<xsl:apply-templates select="poem/author/birth"/>
          -<xsl:apply-templates select="poem/author/death"/>)</p>
        <p><xsl:apply-templates select="poem/date"/></p>  
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
</xsl:template>

<xsl:template match="element(*, gendate)">
  <xsl:variable name="date-value" select="data(.)"/>
  <xsl:choose>
    <xsl:when test="$date-value instance of xs:date">
      <xsl:value-of select="format-date($date-value, '[D] [MNn] [Y]')"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$date-value"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>                   
</xsl:stylesheet>