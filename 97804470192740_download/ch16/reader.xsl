<xsl:stylesheet 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   version="2.0"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" 
   xmlns:FileReader="java:java.io.FileReader"
   xmlns:BufferedReader="java:java.io.BufferedReader"
   exclude-result-prefixes="FileReader BufferedReader">

<xsl:param name="filename" as="xs:string"/>

<xsl:template name="main">
<out>
    <xsl:variable name="reader"
                  select="BufferedReader:new(FileReader:new($filename))"/>
    <xsl:call-template name="read-lines">
        <xsl:with-param name="reader" select="$reader"/>
    </xsl:call-template>
</out>
</xsl:template>

<xsl:template name="read-lines">
    <xsl:param name="reader"/>
    <xsl:variable name="line" select="BufferedReader:readLine($reader)"/>
    <xsl:if test="exists($line)">
        <xsl:value-of select="$line"/><br/>
        <xsl:call-template name="read-lines">
            <xsl:with-param name="reader" select="$reader"/>
        </xsl:call-template>
    </xsl:if>
</xsl:template>
</xsl:stylesheet>

