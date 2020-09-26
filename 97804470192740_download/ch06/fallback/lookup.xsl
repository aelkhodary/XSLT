<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     
     <!-- Example demonstrating fallback for handling a lookup table -->
     <!-- Use with any source document -->

<xsl:variable name="us-states">
  <state abbr="AZ" name="Arizona"/>
  <state abbr="CA" name="California"/>
  <state abbr="NY" name="New York"/>
</xsl:variable>

<xsl:param name="state" select="'AZ'"/>

<xsl:variable name="lookup-table-1.0"
  select="document('')/*/xsl:variable[@name='us-states']"/>

<xsl:template match="/" name="main">
  <xsl:value-of select="$lookup-table-1.0/state[@abbr=$state]/@name"
                use-when="false()"/>
  <xsl:if test="system-property('xsl:version')!='1.0'">              
    <xsl:value-of select="$us-states/state[@abbr=$state]/@name"/>
  </xsl:if>
</xsl:template>
</xsl:stylesheet>
