<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="2.0" 
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xmlns:m="http://www.acme.com/ns/local/months">

<xsl:import-schema>
  <xs:schema targetNamespace="http://www.acme.com/ns/local/months">
  <xs:element name="months">
    <xs:complexType>
      <xs:sequence>
         <xs:element ref="m:month" minOccurs="12" maxOccurs="12"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="month">
    <xs:complexType>
      <xs:attribute name="name" type="xs:string"/>
      <xs:attribute name="abbr" type="xs:string"/>
    </xs:complexType>
  </xs:element>
  </xs:schema>
</xsl:import-schema>

<xsl:template name="main">
  <xsl:variable name="lookup" as="document-node(schema-element(m:months))">
    <xsl:document validation="strict">
			<months xmlns="http://www.acme.com/ns/local/months">
			  <month name="January" abbr="Jan"/>
			  <month name="February" abbr="Feb"/>
			  <month name="March" abbr="Mar"/>
			  <month name="April" abbr="Apr"/>
			  <month name="May" abbr="May"/>
			  <month name="June" abbr="Jun"/>
			  <month name="July" abbr="Jul"/>
			  <month name="August" abbr="Aug"/>
			  <month name="September" abbr="Sep"/>
			  <month name="October" abbr="Oct"/>
			  <month name="November" abbr="Nov"/>
			  <month name="December" abbr="Dec"/>
			</months>
	  </xsl:document>
	</xsl:variable>
	<out><xsl:value-of select="$lookup/m:months/m:month[@abbr='Oct']/@name"/></out>
</xsl:template>		
   
</xsl:stylesheet>