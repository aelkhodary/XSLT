<xsl:stylesheet version="2.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
<xsl:output indent="yes"/>
<xsl:template match="/">
   <system-properties
       xmlns:System="ext://java.lang.System"
       xmlns:Properties="ext://java.util.Properties"
       xmlns:Enumeration="ext://java.util.Enumeration"
       xsl:exclude-result-prefixes="System Properties Enumeration">
   <xsl:variable name="props" 
                 select="System:getProperties()"/> 
   <xsl:variable name="enum" 
                 select="Properties:propertyNames($props)"/>
   <saxon:while test="Enumeration:hasMoreElements($enum)"
          xsl:extension-element-prefixes="saxon"
          xmlns:saxon="http://saxon.sf.net/">
       <xsl:variable name="property-name" 
                     select="Enumeration:nextElement($enum)"/>
       <property name="{$property-name}" 
           value="{Properties:getProperty($props, $property-name)}"/>
   </saxon:while>
   </system-properties>
</xsl:template>
</xsl:stylesheet>
