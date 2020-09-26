<html
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xsl:version="2.0">

<body><center>
   <h1>Programme</h1>
   <xsl:for-each select="/programme/composer">
       <h2><xsl:value-of 
            select="concat(fullname, ' (', born, '-', died, ')')"/></h2>
       <xsl:variable name="c" select="."/>
       <xsl:for-each select="/programme/opera[composer=$c/@name]">
           <p><xsl:value-of select="title"/></p>
       </xsl:for-each>
   </xsl:for-each>
</center></body>
</html>

