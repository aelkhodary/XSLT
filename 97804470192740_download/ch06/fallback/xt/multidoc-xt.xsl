<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>

<xsl:import href="base.xsl"/>

<xsl:output indent="yes"/>

<!-- Version of multidoc.xsl for use with xt. Use with source document ../book-with-preface.xml -->

<xsl:template match="preface"> 
<a href="preface.html"
      xmlns:xt="http://www.jclark.com/xt"
      xsl:extension-element-prefixes="xt">
      <xt:document href="preface.html">
        <xsl:call-template name="write-preface"/>
      </xt:document>
  <xsl:text>Preface</xsl:text>
</a>
</xsl:template>

</xsl:transform>

