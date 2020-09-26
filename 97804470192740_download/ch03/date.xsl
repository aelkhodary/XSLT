<xsl:stylesheet 
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      version="2.0"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
>
<xsl:variable name="date" as="xs:string"
    select="format-date(current-date(), '[MNn] [D1o], [Y]')"/>

</xsl:stylesheet>