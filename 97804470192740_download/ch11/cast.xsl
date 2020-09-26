<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" 
                version="2.0">
                
<!-- These examples of casts are not published in the book, but are provided
     here to illustrate the rules given for casting between primitive types
     in Chapter 11. -->                
                
<xsl:output indent="yes"/>                

<xsl:import-schema>
  <xs:schema>
    <xs:element name="anyURI" type="xs:anyURI"/>
    <xs:element name="base64Binary" type="xs:base64Binary"/>
    <xs:element name="boolean" type="xs:boolean"/>
    <xs:element name="date" type="xs:date"/>
    <xs:element name="dateTime" type="xs:dateTime"/>
    <xs:element name="decimal" type="xs:decimal"/>
    <xs:element name="double" type="xs:double"/>
    <xs:element name="duration" type="xs:duration"/>
    <xs:element name="float" type="xs:float"/>
    <xs:element name="gDay" type="xs:gDay"/>
    <xs:element name="gMonth" type="xs:gMonth"/>
    <xs:element name="gYear" type="xs:gYear"/>
    <xs:element name="gYearMonth" type="xs:gYearMonth"/>
    <xs:element name="hexBinary" type="xs:hexBinary"/>
    <xs:element name="QName" type="xs:QName"/>
    <xs:element name="string" type="xs:string"/>
    <xs:element name="time" type="xs:time"/>
  </xs:schema> 
</xsl:import-schema>

<xsl:variable name="data">
  <data xsl:validation="lax">
    <anyURI>http://www.w3.org/2001/XInclude</anyURI>
    <base64Binary>oLDA0P//EjRWeA==</base64Binary>
    <boolean>true</boolean>
    <boolean>false</boolean>
    <date>2008-04-01</date>
    <date>2008-04-02Z</date>
    <dateTime>2008-05-01T12:00:00</dateTime>
    <dateTime>2008-05-02T12:00:00+01:00</dateTime> 
    <decimal>123.456</decimal>
    <double>0.0</double>
    <double>345.678</double>
    <double>1e12</double>
    <double>INF</double>
    <double>NaN</double>
    <duration>P18M</duration>
    <duration>PT36H</duration>
    <duration>PT0H</duration>
    <float>0.0</float>
    <float>345.678</float>
    <float>1e12</float>
    <float>INF</float>
    <float>NaN</float>
    <gDay>---12</gDay>
    <gDay>---12-05:00</gDay>
    <gMonth>--09</gMonth>
    <gMonth>--09-05:00</gMonth> 
    <gMonthDay>--04-27</gMonthDay>
    <gMonthDay>--04-27-05:00</gMonthDay>
    <gYear>2008</gYear>
    <gYear>2008-08:00</gYear>  
    <gYearMonth>2008-01</gYearMonth>
    <gYearMonth>2008-01-08:00</gYearMonth>
    <hexBinary>A0B0C0D001020304</hexBinary>
    <QName>local</QName>
    <QName xmlns:pre="http://wrox.com/ns">pre:local</QName>
    <string>elastic</string>
    <string>true</string> 
    <string>1</string>
    <string>2008-03-31</string>
    <string>PT1M30S</string>
    <string>13:00:00</string>
    <string>FFFF00</string>   
    <time>12:00:00</time>
    <time>24:00:00Z</time>
  </data>
</xsl:variable>       
                                                                          
<xsl:template name="main">
  <out>
    <xsl:for-each select="$data/data/*">
      <converting fromType="{name()}" fromValue="{string(.)}">
        <target type="xs:anyURI" 
                result="{if (data(.) castable as xs:anyURI) then data(.) cast as xs:anyURI else 'n/a'}"/>
        <target type="xs:base64Binary" 
                result="{if (data(.) castable as xs:base64Binary) then data(.) cast as xs:base64Binary else 'n/a'}"/>
        <target type="xs:boolean" 
                result="{if (data(.) castable as xs:boolean) then data(.) cast as xs:boolean else 'n/a'}"/>
        <target type="xs:date" 
                result="{if (data(.) castable as xs:date) then data(.) cast as xs:date else 'n/a'}"/>
        <target type="xs:dateTime" 
                result="{if (data(.) castable as xs:dateTime) then data(.) cast as xs:dateTime else 'n/a'}"/>
        <target type="xs:decimal" 
                result="{if (data(.) castable as xs:decimal) then data(.) cast as xs:decimal else 'n/a'}"/>
        <target type="xs:double" 
                result="{if (data(.) castable as xs:double) then data(.) cast as xs:double else 'n/a'}"/>
        <target type="xs:duration" 
                result="{if (data(.) castable as xs:duration) then data(.) cast as xs:duration else 'n/a'}"/>
        <target type="xs:float" 
                result="{if (data(.) castable as xs:float) then data(.) cast as xs:float else 'n/a'}"/>
        <target type="xs:gDay" 
                result="{if (data(.) castable as xs:gDay) then data(.) cast as xs:gDay else 'n/a'}"/>
        <target type="xs:gMonth" 
                result="{if (data(.) castable as xs:gMonth) then data(.) cast as xs:gMonth else 'n/a'}"/>
        <target type="xs:gMonthDay" 
                result="{if (data(.) castable as xs:gMonthDay) then data(.) cast as xs:gMonthDay else 'n/a'}"/>
        <target type="xs:gYear" 
                result="{if (data(.) castable as xs:gYear) then data(.) cast as xs:gYear else 'n/a'}"/>
        <target type="xs:gYearMonth" 
                result="{if (data(.) castable as xs:gYearMonth) then data(.) cast as xs:gYearMonth else 'n/a'}"/>
        <target type="xs:hexBinary" 
                result="{if (data(.) castable as xs:hexBinary) then data(.) cast as xs:hexBinary else 'n/a'}"/>
        <target type="xs:string" 
                result="{if (data(.) castable as xs:string) then data(.) cast as xs:string else 'n/a'}"/>
        <target type="xs:time" 
                result="{if (data(.) castable as xs:time) then data(.) cast as xs:time else 'n/a'}"/>
        <target type="xs:untypedAtomic" 
                result="{if (data(.) castable as xs:untypedAtomic) then data(.) cast as xs:untypedAtomic else 'n/a'}"/>
      </converting>
    </xsl:for-each>
  </out>  
</xsl:template>                                                                                                                                                                                                                                                                                                           
</xsl:stylesheet>

