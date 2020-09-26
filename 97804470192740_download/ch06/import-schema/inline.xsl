<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://goliath.com/ns/local" 
    exclude-result-prefixes="xs local"
    version="2.0">

<xsl:import-schema>
  <xs:schema targetNamespace="http://goliath.com/ns/local">
    <xs:simpleType name="dateOrTime">
      <xs:union memberTypes="xs:date xs:time xs:dateTime"/>
    </xs:simpleType>
  </xs:schema>
</xsl:import-schema>

<xsl:function name="local:format" as="xs:string">
  <xsl:param name="in" as="element(*, local:dateOrTime)"/>
  <xsl:variable name="data" select="data($in)"/>
  <xsl:choose>
    <xsl:when test="$data instance of xs:date">
      <xsl:sequence select="format-date($data, '[D] [MNn], [Y]')"/>
    </xsl:when>
    <xsl:when test="$data instance of xs:time">
      <xsl:sequence select="format-time($data, '[H]:[m]')"/>
    </xsl:when>
    <xsl:when test="$data instance of xs:dateTime">
      <xsl:sequence select="format-dateTime($data, '[H]:[m] on [D] [MNn], [Y]')"/>
    </xsl:when>
  </xsl:choose>
</xsl:function>


<xsl:template match="/" name="main">
  <xsl:variable name="now" as="element(*, local:dateOrTime)*">
    <date xsl:type="local:dateOrTime">
      <xsl:value-of select="current-date()"/>
    </date> 
    <time xsl:type="local:dateOrTime">
      <xsl:value-of select="current-time()"/>
    </time>  
    <dateTime xsl:type="local:dateOrTime">
      <xsl:value-of select="current-dateTime()"/>
    </dateTime>
  </xsl:variable>     
  <out date="{local:format($now/self::date)}"
       time="{local:format($now/self::time)}"
       dateTime="{local:format($now/self::dateTime)}"/>
</xsl:template>

</xsl:stylesheet>