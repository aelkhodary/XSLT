<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
 
<xsl:template match="poem">
   <poem>
      <xsl:copy-of select="title, author, date"/>
      <xsl:apply-templates select="stanza"/>
   </poem>
</xsl:template>

<xsl:template match="stanza">
   <xsl:variable name="file" 
                 select="concat('verse', position(), '.xml')"/>
   <verse number="{position()}" href="{$file}"/> 
   <xsl:result-document href="{$file}">
        <xsl:copy-of select="."/> 
   </xsl:result-document>
</xsl:template>
</xsl:stylesheet>

