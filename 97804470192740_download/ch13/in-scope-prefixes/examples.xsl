<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
                exclude-result-prefixes="xs soap"  
                version="2.0">

   <!-- Wrox XSLT 2.0 Programmers Reference 4th Edition -->
   
   <!-- Chapter 13: in-scope-prefixes --> 
   
   <xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>

   <xsl:template match="/">
   <out>
     <ex><xsl:value-of select="in-scope-prefixes(/soap:Envelope)" separator=","/></ex>
     <ex><xsl:value-of select="in-scope-prefixes(//*:inputString)" separator=","/></ex>
   </out>                      
   </xsl:template>

</xsl:stylesheet>