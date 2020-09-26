<html xsl:version="2.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      
      <!-- Stylesheet options.xsl - demonstrate use of xsl:attribute -->
      
<body>
<h1>Please select a country:</h1>
<select id="country">
<xsl:for-each select="//country">
    <option value="{@name}">
    <xsl:if test="@selected='yes'">
       <xsl:attribute name="selected">selected</xsl:attribute>
    </xsl:if>
    <xsl:value-of select="@name"/>
    </option>
</xsl:for-each>
</select>
<hr/>
</body>
</html>

