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

<xsl:template match="preface"> 
<a href="preface.html"
      xmlns:saxon6="http://icl.com/saxon"
      xmlns:xt="http://www.jclark.com/xt"
      xmlns:xalan="http://xml.apache.org/xalan/redirect" 
      xsl:extension-element-prefixes="saxon6 xt xalan">   
  <xsl:result-document href="preface.html">
   <xsl:call-template name="write-preface"/>
   <xsl:fallback>
     <saxon6:output href="preface.html">
        <xsl:call-template name="write-preface"/>
        <xsl:fallback/>
     </saxon6:output>
     <xt:document href="preface.html">
        <xsl:call-template name="write-preface"/>
        <xsl:fallback/>
     </xt:document>
     <xalan:write file="preface.html">
        <xsl:call-template name="write-preface"/>
        <xsl:fallback/>
     </xalan:write>
  </xsl:fallback>
</xsl:result-document>
Preface</a>
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

