<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:axml="alias">
  
<xsl:namespace-alias stylesheet-prefix="axml" result-prefix="xml"/>

<xsl:template match="/">
  <doc axml:space="preserve">text</doc>
</xsl:template>

</xsl:transform>

