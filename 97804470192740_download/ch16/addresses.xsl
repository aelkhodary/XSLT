<xsl:stylesheet 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:FileReader="java:java.io.FileReader"
   xmlns:BufferedReader="java:java.io.BufferedReader"
   exclude-result-prefixes="FileReader BufferedReader">

<xsl:output indent="yes"/>
<xsl:param name="filename" as="xs:string"/>

<xsl:template name="main">
    <xsl:variable name="reader" 
                  select="BufferedReader:new( FileReader:new($filename))"/>
    <xsl:call-template name="read-addresses">
        <xsl:with-param name="reader" select="$reader"/>
    </xsl:call-template>
</xsl:template>

<xsl:template name="read-addresses">
   <xsl:param name="reader"/>
   <xsl:variable name="line1" select="BufferedReader:readLine($reader)"/>
   <xsl:if test="$line1 != '****'">
     <xsl:variable name="line2" select="BufferedReader:readLine($reader)"/>
     <xsl:variable name="line3" select="BufferedReader:readLine($reader)"/>
     <xsl:variable name="line4" select="BufferedReader:readLine($reader)"/>
     <xsl:variable name="line5" select="BufferedReader:readLine($reader)"/>
     <label>
       <address>
         <xsl:value-of select="$line3"/><br/>
         <xsl:value-of select="$line4"/><br/>
       </address>
           <recipient>Attn: <xsl:value-of select="$line2"/></recipient>
     </label>
     <xsl:call-template name="read-addresses">
         <xsl:with-param name="reader" select="$reader"/>
     </xsl:call-template>
   </xsl:if>
</xsl:template>
</xsl:stylesheet>