<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:xs="http://www.w3.org/2001/XMLSchema"
 xmlns:f="http://wrox.com/ns/gedcom"
 exclude-result-prefixes="xs f"
 version="2.0"
>

<!-- This stylesheet converts from the XML representation GEDCOM 5.5
     to the GEDCOM 6.0 XML beta specification -->
     
<xsl:strip-space elements="*"/>
<xsl:output method="xml" indent="yes" encoding="iso-8859-1"/>
     
<!-- import the schema for the result vocabulary -->

<xsl:import-schema schema-location="gedSchema.xsd"/>          

<xsl:param name="submitter" select="'Michael Kay'"/>

<xsl:template match="/">
  <xsl:result-document validation="strict">
     <GEDCOM>
        <HeaderRec>
          <FileCreation Date="{f:today()}"/>
          <Submitter>
             <Link Target="ContactRec" Ref="Contact-Submitter"/>
          </Submitter>
        </HeaderRec>
        <xsl:call-template name="families"/>
        <xsl:call-template name="individuals"/>
        <xsl:call-template name="events"/>
        <ContactRec Id="Contact-Submitter">
          <Name><xsl:value-of select="$submitter"/></Name>
        </ContactRec>
     </GEDCOM>
  </xsl:result-document>       
</xsl:template>

<xsl:template name="families">
  <xsl:apply-templates select="/*/FAM"/>
</xsl:template>

<xsl:template match="FAM">
  <FamilyRec Id="{@ID}">
    <xsl:apply-templates select="HUSB, WIFE, CHIL"/>
  </FamilyRec>
</xsl:template>

<xsl:template match="FAM/HUSB">
  <HusbFath>
    <Link Target="IndividualRec" Ref="{@REF}"/>
  </HusbFath>
</xsl:template>

<xsl:template match="FAM/WIFE">
  <WifeMoth>
    <Link Target="IndividualRec" Ref="{@REF}"/>
  </WifeMoth>
</xsl:template>

<xsl:template match="FAM/CHIL">
  <Child>
    <Link Target="IndividualRec" Ref="{@REF}"/>
  </Child>
</xsl:template>

<xsl:template name="individuals">
  <xsl:apply-templates select="/*/INDI"/>
</xsl:template>

<xsl:template match="INDI">
  <IndividualRec Id="{@ID}">
    <xsl:apply-templates select="NAME, SEX, REFN, NOTE, CHAN"/>
  </IndividualRec>
</xsl:template>

<xsl:template match="INDI/NAME">
  <IndivName>
    <xsl:analyze-string select="." regex="/(.*?)/">
      <xsl:matching-substring>
        <xsl:text> </xsl:text>
        <NamePart Type="surname" Level="1"><xsl:value-of select="regex-group(1)"/></NamePart>
        <xsl:text> </xsl:text>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </IndivName>
</xsl:template>

<xsl:template match="INDI/SEX">
  <Gender>
    <xsl:apply-templates/>
  </Gender>
</xsl:template>

<xsl:template match="INDI/REFN">
  <ExternalID Type="REFN" Id="{.}"/>
</xsl:template>

<xsl:template match="INDI/CHAN">
  <Changed Date="{DATE}" Time="00:00"/>
</xsl:template>

<xsl:template match="NOTE">
  <Note>
    <xsl:apply-templates/>
  </Note>
</xsl:template>

<xsl:template match="CONT">
  <xsl:text>&#x0a;</xsl:text>
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template name="events">
  <xsl:apply-templates mode="event"
     select="/GED/INDI/(BIRT|BAPM|DEAT|BURI) | /GED/FAM/(MARR|DIV)" />
  <xsl:apply-templates select="/GED/(INDI|FAM)/EVEN"/>
</xsl:template>

<xsl:template match="*" mode="event">
  <xsl:variable name="id">
    <xsl:value-of select="../@ID"/>
    <xsl:text>-</xsl:text>
    <xsl:number count="*"/>
  </xsl:variable>
  <EventRec Id="{$id}">
    <xsl:copy-of select="$event-mapping/*[name()=name(current())]/@*"/>
    <xsl:apply-templates select="." mode="participants"/>
    <xsl:apply-templates select="DATE, PLAC, NOTE"/>
  </EventRec>
</xsl:template>

<xsl:variable name="event-mapping">
  <BIRT Type="birth" VitalType="birth"/>
  <BAPM Type="baptism" VitalType="birth"/>  
  <DEAT Type="death" VitalType="death"/>
  <BURI Type="burial" VitalType="death"/>
  <MARR Type="marriage" VitalType="marriage"/>
  <DIV Type="divorce" VitalType="divorce"/>  
</xsl:variable>

<xsl:template match="EVEN">
  <xsl:variable name="id">
    <xsl:value-of select="../@ID"/>
    <xsl:text>-</xsl:text>
    <xsl:number count="*"/>
  </xsl:variable>
  <EventRec Id="{$id}" Type="{TYPE}">
    <xsl:apply-templates select="." mode="participants"/>
    <xsl:apply-templates select="DATE, PLAC, NOTE"/>
  </EventRec>
</xsl:template>

<xsl:template match="INDI/*" mode="participants">
  <Participant>
    <Link Target="IndividualRec" Ref="{../@ID}"/>
    <Role>principal</Role>
  </Participant>
</xsl:template>

<xsl:template match="FAM/*" mode="participants">
  <Participant>
    <Link Target="IndividualRec" Ref="{../HUSB/@REF}"/>
    <Role>husband</Role>
  </Participant>
  <Participant>
    <Link Target="IndividualRec" Ref="{../WIFE/@REF}"/>
    <Role>wife</Role>
  </Participant>  
</xsl:template>

<xsl:template match="DATE">
  <Date><xsl:apply-templates/></Date>
</xsl:template>

<xsl:template match="PLAC">
  <Place>
    <xsl:choose>
      <xsl:when test="matches(., '^.*,\s*[A-Z]{2},\s*USA\s*$')">
        <xsl:analyze-string select="." regex="^(.*),\s*([A-Z]{{2}}),\s*USA\s*$">
          <xsl:matching-substring>
            <PlaceName>
              <PlacePart Type="country" Level="1">USA</PlacePart>
              <PlacePart Type="state" Level="2">
                <xsl:value-of select="regex-group(2)"/>
              </PlacePart>
              <xsl:for-each select="reverse(tokenize(regex-group(1), ','))">
                <PlacePart Level="{5+position()}">
                  <xsl:value-of select="normalize-space(.)"/>
                </PlacePart>
              </xsl:for-each>
            </PlaceName>
          </xsl:matching-substring>
          <xsl:non-matching-substring>
            <xsl:message>Error: string "<xsl:value-of select="."/>" does not match regex</xsl:message>
          </xsl:non-matching-substring>
        </xsl:analyze-string>
      </xsl:when>
      <xsl:otherwise>
        <PlaceName><xsl:value-of select="."/></PlaceName>
      </xsl:otherwise>
    </xsl:choose>   
  </Place>
</xsl:template>

<xsl:function name="f:today" as="xs:string">
  <xsl:sequence select="format-date(current-date(), '[D1] [MN,*-3] [Y0001]')"/>
</xsl:function>  
 
</xsl:transform>

