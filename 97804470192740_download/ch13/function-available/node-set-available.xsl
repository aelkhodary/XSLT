<xsl:stylesheet
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          version="2.0">
          
<xsl:template match="/" name="main">
  <xsl:call-template name="process-tree-fragment">
    <xsl:with-param name="fragment">
      <fragment>
        <fragment-contents>42</fragment-contents>
      </fragment>
    </xsl:with-param>
  </xsl:call-template>  
</xsl:template>          
          
<xsl:template name="process-tree-fragment"
          xmlns:msxml="urn:schemas-microsoft-com:xslt"
          xmlns:xt="http://www.jclark.com/xt"
          xmlns:exslt="http://www.exslt.org/common" 
          xmlns:saxon6="http://icl.com/saxon">
  <xsl:param name="fragment"/>
  <xsl:choose>
    <xsl:when test="number(system-property('xsl:version')) &gt; 1.0">
      <xsl:apply-templates mode="process-fragment"
                           select="$fragment"/>
    </xsl:when>
    <xsl:otherwise use-when="system-property('xsl:version') eq '1.0'">
      <xsl:choose>  
        <xsl:when test="function-available('exslt:node-set')">
          <xsl:apply-templates mode="process-fragment"
                               select="exslt:node-set($fragment)"/>
        </xsl:when>   
        <xsl:when test="function-available('msxml:node-set')">
          <xsl:apply-templates mode="process-fragment"
                               select="msxml:node-set($fragment)"/>
        </xsl:when>   
        <xsl:when test="function-available('xt:node-set')">
          <xsl:apply-templates mode="process-fragment"
                               select="xt:node-set($fragment)"/>
        </xsl:when>     
        <xsl:when test="function-available('saxon6:node-set')">
          <xsl:apply-templates mode="process-fragment"
                               select="saxon6:node-set($fragment)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:message terminate="yes">
            Cannot convert result tree fragment to node-set
          </xsl:message>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="fragment" mode="process-fragment">
  <xsl:copy-of select="*"/>
</xsl:template>

</xsl:stylesheet>

