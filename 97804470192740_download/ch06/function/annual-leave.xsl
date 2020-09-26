<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:xs="http://www.w3.org/2001/XMLSchema"
     xmlns:pers="http://ns.megacorp.com/hr"
     exclude-result-prefixes="xs pers">
     
<xsl:import-schema namespace="http://ns.megacorp.com/hr"
                   schema-location="employee.xsd"/>
                   
<xsl:key name="emp" match="pers:employee" use="@nr"/>
     
<xsl:function name="pers:annual-leave" as="xs:integer"
              xpath-default-namespace="http://ns.megacorp.com/hr">
  <xsl:param name="emp" as="schema-element(employee)"/>
  <xsl:variable name="service"
                as="xs:yearMonthDuration"
                 select="pers:monthDifference(
                            current-date(),
                            $emp/date-of-joining)"/>
  <xsl:choose>
    <xsl:when test="$service gt xs:yearMonthDuration('P10Y')">
      <xsl:sequence select="20"/>
    </xsl:when>
    <xsl:when test="$service gt xs:yearMonthDuration('P3Y')">
      <xsl:sequence select="17"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:sequence select="15"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>
<xsl:function name="pers:monthDifference" as="xs:yearMonthDuration">
  <xsl:param name="arg1" as="xs:date"/>
  <xsl:param name="arg2" as="xs:date"/>
  <xsl:variable name="m"
       select="(year-from-date($arg1)-year-from-date($arg2))*12
                + (month-from-date($arg1)-month-from-date($arg2))"/>
  <xsl:sequence select="$m * xs:yearMonthDuration('P1M')"/>
</xsl:function>

<xsl:function name="pers:line-manager" as="schema-element(pers:employee)?"
       xpath-default-namespace="http://ns.megacorp.com/hr">
  <xsl:param name="emp" as="schema-element(employee)"/>
  <xsl:variable name="mgr-nr"
                select="doc('departments.xml')
                          /departments
                          /department[@dept-nr = $emp/department]
                          /manager-nr"/>
  <xsl:sequence select="doc('employees.xml')
                          /key('emp', $mgr-nr)"/>
</xsl:function>


<xsl:template match="/">
  <emps>
    <xsl:for-each select="//pers:employee">
      <emp name="{pers:name}" leave="{pers:annual-leave(.)}"/>
    </xsl:for-each>
  </emps>
</xsl:template>

<xsl:template match="/" mode="manager">
  <emps>
    <xsl:for-each select="//pers:employee">
      <emp name="{pers:name}" manager="{pers:line-manager(.)/pers:name}"/>
    </xsl:for-each>
  </emps>
</xsl:template>



</xsl:stylesheet>

