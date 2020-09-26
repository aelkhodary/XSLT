<xsl:stylesheet
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          xmlns:xs="http://www.w3.org/2001/XMLSchema"
          exclude-result-prefixes="xs"
          version="2.0">
          
<xsl:template match="/">
	<xsl:variable name='charset-ok'
	              as='xs:boolean'
	              select='Charset:isSupported("EUC-JP")'
	              xmlns:Charset='java:java.nio.charset.Charset'
	              use-when='function-available("Charset:isSupported", 1)'/>
	<xsl:variable name='charset-ok'
	              as='xs:boolean'
	              select='false()'
	              xmlns:Charset='java:java.nio.charset.Charset'
	              use-when='not(function-available("Charset:isSupported", 1))'/>
	<xsl:result-document encoding="{if ($charset-ok) then 'EUC-JP' else 'UTF-8'}">
	  <xsl:apply-templates/>
	</xsl:result-document>            
</xsl:template>          
          


</xsl:stylesheet>

