<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0">
   
<xsl:param name="title">Management Structure</xsl:param>

<xsl:output indent="yes"/>

<xsl:template match="/">   
    <html>   
    <head>
       <title><xsl:value-of select="$title"/></title>
    </head>
    <body>
       <xsl:comment>
				   Created using <xsl:value-of select="system-property('xsl:vendor')"/>
			 </xsl:comment>

       <h1><xsl:value-of select="$title"/></h1>
       <p>The following responsibilies were announced on 
          <xsl:value-of select="/orgchart/@date"/>:</p>
       <table border="2" cellpadding="5">
       <tr>
          <th>Name</th><th>Role</th><th>Reporting to</th>
       </tr>
       <xsl:for-each select="//person">
          <tr>
             <td><xsl:value-of select="name"/></td>
             <td><xsl:value-of select="title"/></td>
             <td><xsl:value-of select="ancestor::person[1]/name"/></td>
          </tr>
       </xsl:for-each>
       </table>
       <hr/>
    </body>
    </html>
</xsl:template>

</xsl:stylesheet>

