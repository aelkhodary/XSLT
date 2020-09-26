<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>
<xsl:output indent="yes"/>

<!-- Demonstrates xsl:fallback. Use with source document book-with-preface.xml -->

<xsl:template match="*">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template name="write-preface">
  <html>
    <head>
      <title>The preface</title>
    </head>
    <body>
      <p>In the beginning was the Word.</p>
    </body>
  </html>
</xsl:template>


</xsl:transform>

