<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">

<xsl:template match="poem">
    <poem>
        <xsl:copy-of select="title"/>      
        <xsl:copy-of select="author"/>      
        <xsl:copy-of select="date"/>      
        <xsl:apply-templates select="stanza"/>   
    </poem>
</xsl:template>
<xsl:template match="stanza">   
    <xsl:variable name="file" 
                  select="concat('verse', string(position()), '.xml')"/>   
    <verse number="{position()}" href="{$file}"/>
    <xsl:choose>
    <xsl:when test="element-available('xsl:result-document')">
        <xsl:result-document href="{$file}">        
            <xsl:copy-of select="."/>    
        </xsl:result-document>    
    </xsl:when>    
    <xsl:when test="element-available('saxon:output')"
            xmlns:saxon="http://icl.com/saxon">
        <saxon:output href="{$file}"
            xsl:extension-element-prefixes="saxon">        
            <xsl:copy-of select="."/>    
        </saxon:output>    
    </xsl:when>    
    <xsl:otherwise>
        <xsl:message terminate="yes"
             >Cannot write to multiple output files</xsl:message>
    </xsl:otherwise>
    </xsl:choose>   
</xsl:template>

</xsl:stylesheet>

