<xsl:transform
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:ged="http://www.wrox.com/569090/gedcom"
   exclude-result-prefixes="xs ged"                          
   version="1.0" >
   
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<!-- parameter to supply the Id of the person to be displayed. 
     Default value is the Id of the first person in the data set -->
  
<xsl:param name="id" select="/*/IndividualRec[1]/@Id"/>

<!-- keys to allow records to be found by their Id -->

<xsl:key name="indi" match="IndividualRec" use="@Id"/>
<xsl:key name="fam" match="FamilyRec" use="@Id"/>

<!-- a key that locates the family record for a given child -->

<xsl:key name="family-of-child" match="FamilyRec" use="Child/Link/@Ref"/>

<!-- a key that locates the family records for a given parent -->

<xsl:key name="families-of-parent" match="FamilyRec" use="HusbFath/Link/@Ref | WifeMoth/Link/@Ref"/>

<!-- a key to allow events to be found for a given individual -->

<xsl:key name="events-for-person" match="EventRec" use="Participant/Link/@Ref"/>
                 

<xsl:template match="/">
    <xsl:variable name="person" select="key('indi', $id)"/>
    <xsl:apply-templates select="$person"/>
</xsl:template>

<xsl:template match="IndividualRec">
	<html>
        <head>
            <xsl:call-template name="css-style"/>
            <xsl:variable name="name">
                <xsl:apply-templates select="IndivName[1]"/>
            </xsl:variable>
            <title><xsl:value-of select="$name"/></title>
        </head>

        <body>

            <!-- Show name and parentage -->

            <h1><xsl:value-of select="$id"/>: <xsl:apply-templates select="IndivName[1]"/></h1>
            <xsl:if test="IndivName[2]">
              <p>
                <span class="label">Also known as: </span>
                <xsl:for-each select="IndivName[position() >= 2]">
                  <xsl:apply-templates select="."/>
                  <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
              </p>
            </xsl:if>
            <xsl:call-template name="show-parents"/>
            <hr/>

            <table>
            <tr>

                <!-- Show events and attributes -->

                <td width="50%" valign="top">
                    <xsl:call-template name="show-events"/>                        
                </td>
                <td width="20%"/>

                <!-- Show children -->

                <td width="30%" valign="top">
                    <xsl:call-template name="show-partners"/>
                </td>
            </tr>
            </table>

            <hr/>

            <!-- Show notes -->

            <xsl:for-each select="Note">
                <p class="text"><xsl:apply-templates mode="note"/></p>
                <xsl:if test="position() = last()"><hr/></xsl:if>
            </xsl:for-each>

        </body>
    </html>
</xsl:template>


 
<xsl:template name="show-parents">

  <xsl:variable name=   "parental-family"
                select= "key('family-of-child', @Id)[1]"/>
                  
  <xsl:variable name=   "father"
                select= "key('indi', $parental-family/HusbFath/Link/@Ref)"/>
                  
  <xsl:variable name=   "mother"
                select= "key('indi', $parental-family/WifeMoth/Link/@Ref)"/>

  <p>
    <xsl:if test="$father">
        <span class="label">Father: </span><xsl:apply-templates select="$father/IndivName" mode="link"/>&#xa0;
    </xsl:if>
    <xsl:if test="$mother">
        <span class="label">Mother: </span><xsl:apply-templates select="$mother/IndivName" mode="link"/>&#xa0; 
    </xsl:if>
  </p>
</xsl:template>

<!-- Show the events for an individual -->

<xsl:template name="show-events">
  <xsl:variable name=   "subject"
                select= "."/>
                
  <xsl:for-each select="key('events-for-person', $subject/@Id)">
        <xsl:sort select="substring(Date, string-length(Date)-3)"/>

        <h3><xsl:value-of select="@Type"/></h3>
        <p>
        <xsl:for-each select="Participant[Link/@Ref != $subject/@Id]">
            <span class="label"><xsl:value-of select="Role"/>: </span>
            <xsl:apply-templates select="key('indi',Link/@Ref)/IndivName[1]" mode="link"/>
            <br/>
        </xsl:for-each>
        <xsl:if test="Date">
            <span class="label">Date: </span><xsl:apply-templates select="Date"/><br/>
        </xsl:if>
        <xsl:if test="Place">
            <span class="label">Place: </span><xsl:apply-templates select="Place"/><br/>
        </xsl:if>
        </p>
        <xsl:for-each select="Note">
            <p class="text"><xsl:apply-templates mode="note"/></p>
        </xsl:for-each>
    
    </xsl:for-each>
</xsl:template>

<xsl:template name="show-partners">
  <xsl:variable name=   "subject" 
                select= "."/>
                
  <xsl:variable name=   "partnerships"
                select= "key('families-of-parent', @Id)"/>
                
  <xsl:for-each select="$partnerships">
        
    <xsl:variable name=   "partner"
                  select= "key('indi', HusbFath/Link/@Ref | WifeMoth/Link/@Ref)[@Id != $subject/@Id]"/>

    <xsl:variable name=   "partner-seq">
      <xsl:choose>
      <xsl:when test="count($partnerships) = 1"/>
      <xsl:otherwise><xsl:value-of select="position()"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:if test="$partner">
      <h2>Partner <xsl:value-of select="$partner-seq"/></h2>
      <p><xsl:apply-templates select="$partner/IndivName[1]" mode="link"/></p>
    </xsl:if>

    <xsl:if test="Child">
      <h3>Children:</h3>
      <p>
        <xsl:for-each select="Child">         
          <xsl:variable name=   "child"
                        select= "key('indi',Link/@Ref)"/>
                        
          <xsl:apply-templates select="$child/IndivName[1]" mode="link"/><br/>
        </xsl:for-each>
      </p>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template match="IndivName" mode="link">
	<a>
		<xsl:attribute name="href">
			<xsl:call-template name="make-href"/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</a>
</xsl:template>

<xsl:template match="NamePart[@Type='surname']">
    <xsl:text> </xsl:text>
    <span class="surname"><xsl:apply-templates/></span>
    <xsl:text> </xsl:text>
</xsl:template>

<xsl:template name="make-href">
	<xsl:value-of select="concat(../@Id, '.html')"/>
</xsl:template>

<xsl:template match="Date">
  <xsl:value-of select="."/>
</xsl:template>


<xsl:template match="PlaceName[PlacePart]">
  <xsl:for-each select="PlacePart">
    <xsl:sort select="@Level" order="descending" data-type="number"/>
    <xsl:value-of select="."/>
    <xsl:if test="position() != last()">, </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="css-style">
    <style type="text/css">

	H1 {
	    font-family: Verdana, Helvetica, sans-serif;
	    font-size: 18pt;
	    font-weight: bold;
	    color: "#FF0080"
	}

	H2 {
	    font-family: Verdana, Helvetica, sans-serif;
	    font-size: 14pt;
	    font-weight: bold;
	    color: black;
	}

	H3 {
	    font-family: Lucida Sans, Helvetica, sans-serif;
	    font-size: 11pt;
	    font-weight: bold;
	    color: black;
	}

	SPAN.surname {
	    font-weight: bold;
        text-decoration: underline;
	}

	SPAN.label {
	    font-family: Lucida Sans, Helvetica, sans-serif;
	    font-size: 10pt;
	    font-weight: normal;
        font-style: italic;
	    color: black;
	}

    P,LI,TD {
	    font-family: Lucida Sans, Helvetica, sans-serif;
	    font-size: 10pt;
	    font-weight: normal;
	    color: black;       
	}

    P.text {
	    font-family: Comic Sans MS, Helvetica, sans-serif;
	    font-size: 10pt;
	    font-weight: normal;
	    color: black;       
	}

    </style>
</xsl:template>



</xsl:transform>

