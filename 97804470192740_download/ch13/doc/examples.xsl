<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: doc --> 
   
   <xsl:output method="text"  encoding="iso-8859-1"/>

   <xsl:template match="/">
   <xsl:value-of select="string-join(
								        for $c in doc('countries.xml')/countries/country return
								            concat($c/@name, ': ',
								                   count(//employee[location/country = $c/@code])),
								        '&#x0a;')"/>
   </xsl:template>

</xsl:stylesheet>