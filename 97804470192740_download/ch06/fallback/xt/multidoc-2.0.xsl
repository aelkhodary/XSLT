<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>

<xsl:import href="base.xsl"/>
<xsl:output indent="yes"/>

<!-- Demonstrates xsl:fallback. Use with source document ../book-with-preface.xml -->

<!-- This stylesheet should work with any conforming XSLT 2.0 processor, or with
     the Saxon and Xalan XSLT 1.0 processors. It doesn't work with xt, because xt
     doesn't implement forwards-compatible processing or xsl:fallback. For an xt
     solution, use the alternative stylesheet module multidoc-xt.xsl -->

<xsl:template match="preface"> 
<a href="preface.html"
      xmlns:saxon6="http://icl.com/saxon"
      xmlns:xt="http://www.jclark.com/xt"
      xmlns:xalan="http://xml.apache.org/xalan/redirect" 
      xsl:extension-element-prefixes="saxon6 xt xalan">
  <xsl:choose>
    <xsl:when test="element-available('xsl:result-document')">           
      <xsl:result-document href="preface.html">
        <xsl:call-template name="write-preface"/>
      </xsl:result-document>
    </xsl:when>
    <xsl:otherwise>  
      <saxon6:output href="preface.html">
        <xsl:call-template name="write-preface"/>
        <xsl:fallback/>
      </saxon6:output>
      <xalan:write file="preface.html">
        <xsl:call-template name="write-preface"/>
        <xsl:fallback/>
      </xalan:write>
    </xsl:otherwise>  
  </xsl:choose>
  <xsl:text>Preface</xsl:text>
</a>
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

