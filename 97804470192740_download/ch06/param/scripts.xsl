<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">

<!-- parameter "dir" must be set from the command line: it represents the output directory -->

<xsl:import href="play.xsl"/>

<xsl:template match="/">
  <xsl:variable name="play" select="PLAY"/>
  <xsl:result-document href="file:///{$dir}/index.html" format="play">   
    <HTML>
    <HEAD><TITLE><xsl:apply-templates select="PLAY/TITLE"/></TITLE></HEAD>
    <BODY BGCOLOR='{$backcolor}'>
        <CENTER>
            <H1><xsl:value-of select="PLAY/TITLE"/></H1>
            <H3><xsl:apply-templates select="PLAY/PLAYSUBT"/></H3>
            <I><xsl:apply-templates select="PLAY/SCNDESCR"/></I>
        <BR/><BR/>
        <P>
          <xsl:for-each select="distinct-values(//SPEAKER)">
            <A HREF="{encode-for-uri(.)}/play.html"><xsl:value-of select="."/></A>
            <xsl:if test="position() ne last()"> | </xsl:if>
            <xsl:apply-templates select="$play">
              <xsl:with-param name="speaker" select="." tunnel="yes"/>
            </xsl:apply-templates>
          </xsl:for-each>
        </P>
        </CENTER>
    </BODY>
    </HTML>
  </xsl:result-document>  
</xsl:template>

<xsl:template match="PLAY">
    <xsl:param name="speaker" tunnel="yes" required="yes"/>
    <xsl:if test="not($dir)">
        <xsl:message terminate="yes">Parameter "dir" has not been set</xsl:message>
    </xsl:if>
    <xsl:result-document href="file:///{$dir}/{encode-for-uri($speaker)}/play.html" format="play">
    <HTML>
    <HEAD><TITLE><xsl:apply-templates select="TITLE"/></TITLE></HEAD>
    <BODY BGCOLOR='{$backcolor}'>
        <CENTER>
            <H1><xsl:value-of select="TITLE"/></H1>
            <H3><xsl:apply-templates select="PLAYSUBT"/></H3>
            <I><xsl:apply-templates select="SCNDESCR"/></I>
        </CENTER><BR/><BR/>
        <TABLE><TR>
            <TD WIDTH='350' VALIGN='TOP' BGCOLOR='{$panelcolor}'>
            <xsl:apply-templates select="PERSONAE"/>
            </TD>
            <TD WIDTH='30'></TD>
            <TD VALIGN='TOP'>
            <xsl:apply-templates select="PROLOGUE | ACT | EPILOGUE"/>
            </TD>
        </TR></TABLE><HR/>
    </BODY></HTML>
    </xsl:result-document>
</xsl:template>

<xsl:template match="SCENE|PROLOGUE|EPILOGUE">
    <xsl:param name="speaker" tunnel="yes" required="yes"/>
    <xsl:variable name="NR"><xsl:number count="SCENE|PROLOGUE|EPILOGUE" level="any"/></xsl:variable>
    <xsl:variable name="play" select="ancestor::PLAY/TITLE"/>
    <xsl:variable name="act" select="ancestor::ACT/TITLE"/>

    <xsl:choose>
    <xsl:when test=".//SPEAKER = $speaker">
        <A HREF="scene{$NR}.html">
            <xsl:value-of select="TITLE" />
        </A><BR/>
    
        <xsl:result-document href="file:///{$dir}/{encode-for-uri($speaker)}/scene{$NR}.html" format="scene">
            <HTML>
            <HEAD>
            <TITLE><xsl:value-of select="concat($play, ' ', $act, ': ', TITLE)"/></TITLE>
            </HEAD>
            <BODY BGCOLOR='{$backcolor}'>
            <P>
                <A HREF="play.html"><xsl:value-of select="$play"/></A><BR/>
                <B><xsl:value-of select="$act"/></B><BR/>
            </P>
            <xsl:apply-templates/>
            </BODY>
            </HTML>
        </xsl:result-document>
    </xsl:when>
    <xsl:otherwise>
        <xsl:value-of select="TITLE" /><BR/>
    </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="SPEECH">
    <xsl:param name="speaker" required="yes" tunnel="yes"/>
    <TABLE><TR>
    <TD WIDTH="160" VALIGN="TOP">
    <xsl:if test="SPEAKER = $speaker">
       <xsl:attribute name="BGCOLOR" select="'cyan'"/>
    </xsl:if>
	<xsl:apply-templates select="SPEAKER"/>
    </TD>
    <TD VALIGN="TOP">
    <xsl:apply-templates select="STAGEDIR|LINE"/>
    </TD>
	</TR></TABLE>
</xsl:template>

</xsl:stylesheet>	
