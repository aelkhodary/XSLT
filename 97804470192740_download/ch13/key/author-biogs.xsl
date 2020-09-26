<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0"
>
<xsl:key name="biog" match="author" use="@name"/>
<xsl:variable name="biogs" select="document('authors.xml')"/>
<xsl:template match="/">
  <html><body>

  <xsl:variable name="all-books" select="//book"/>
    <xsl:for-each select="$all-books">
                 <!-- for each book in the booklist file -->      
      <h1><xsl:value-of select="title"/></h1>
      <h2>Author<xsl:if test="count(author)!=1">s</xsl:if></h2>
      <xsl:for-each select="author">
                 <!-- for each author of this book -->
         <xsl:variable name="name" select="."/>
         <h3><xsl:value-of select="$name"/></h3>
                 <!--locate the biography by key lookup -->
         <xsl:variable name="auth" 
                         select="$biogs/key('biog', $name)"/>
         <p><xsl:value-of 
                select="concat($auth/born, ' - ', $auth/died)"/>
         </p>
         <p><xsl:value-of select="$auth/biog"/></p>
       </xsl:for-each>
    </xsl:for-each>
  </body></html>
</xsl:template>

</xsl:transform>


