<xsl:transform
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     version="2.0">
     
<xsl:template match="SCENE">
<html><body>
   <xsl:apply-templates select="TITLE"/>
   
   <xsl:variable name="speakers" as="element()*">
     <xsl:for-each-group select="//SPEAKER" group-by=".">
       <xsl:sequence select="current-group()[1]"/>
     </xsl:for-each-group>
   </xsl:variable>

   <h2>Cast: <xsl:apply-templates select="$speakers" mode="cast-list"/></h2>
   <xsl:apply-templates select="* except TITLE"/>
</body></html>
</xsl:template>

<xsl:template match="SPEAKER" mode="cast-list">
    <xsl:value-of select="."/>
    <xsl:if test="not(position()=last())">, </xsl:if>
</xsl:template>

<xsl:template match="TITLE">
<h1><xsl:apply-templates/></h1>
</xsl:template>

<xsl:template match="STAGEDIR">
<i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="SCENE/STAGEDIR">
<p><i><xsl:apply-templates/></i></p>
</xsl:template>

<xsl:template match="SPEECH">
<p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="SPEAKER">
<b><xsl:apply-templates/></b><br/>
</xsl:template>

<xsl:template match="LINE">
<xsl:apply-templates/><br/>
</xsl:template>

</xsl:transform>	
