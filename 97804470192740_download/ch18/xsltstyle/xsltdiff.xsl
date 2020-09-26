<?xml version="1.0"?>

<!-- Version: $Id: xsltdiff.xsl,v 1.2 2006/11/14 00:34:02 NormanWalsh Exp $ -->

<!-- Stylesheet for @diff markup in XMLspec -->
<!-- Author: Norman Walsh (Norman.Walsh@East.Sun.COM) -->
<!-- Date Created: 2000.07.21 -->

<!-- Modified by MHK to do differencing since a baseline. The @diff value
     is compared to the $baseline parameter using XPath rules (we use string
     comparison, available only in XPath 2.0) -->

<!-- This stylesheet is copyright (c) 2000 by its authors.  Free
     distribution and modification is permitted, including adding to
     the list of authors and copyright holders, as long as this
     copyright notice is maintained. -->

<!-- This stylesheet attempts to implement the XML Specification V2.1
     DTD.  Documents conforming to earlier DTDs may not be correctly
     transformed.

     This stylesheet supports the use of change-markup with the @diff
     attribute. If you use @diff, you should always use this stylesheet.
     If you want to turn off the highlighting of differences, use this
     stylesheet, but set show.diff.markup to 0.

     Using the original xmlspec stylesheet with @diff markup will cause
     @diff=del text to be presented.
-->

<!-- ChangeLog:
     17 Sep 2002: Michael Kay
       - parameterized the colors
       - added extra CSS styles for XSLT
     16 Sep 2002: Michael Kay
       - modified to ignore diff markup if the @at attribute
         is before the baseline given as a parameter
     25 Sep 2000: (Norman.Walsh@East.Sun.COM)
       - Use inline diff markup (as opposed to block) for name and
         affiliation
       - Handle @diff='del' correctly in bibl and other list-contexts.
     14 Aug 2000: (Norman.Walsh@East.Sun.COM)
       - Support additional.title param
     27 Jul 2000: (Norman.Walsh@East.Sun.COM)
       - Fix HTML markup problem with diff'd authors in authlist
     26 Jul 2000: (Norman.Walsh@East.Sun.COM)
       - Update pointer to latest xmlspec-stylesheet.
     21 Jul 2000: (Norman.Walsh@East.Sun.COM)
       - Initial version
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

<xsl:import href="xslt.xsl"/>

<xsl:param name="show.diff.markup">1</xsl:param>
<xsl:param name="baseline"/>

<xsl:param name="add-color" select="'#ffff99'"/>
<xsl:param name="chg-color" select="'#99ff99'"/>

<xsl:param name="additional.css">
<xsl:if test="$show.diff.markup = '1'">
div.diff-add  { background-color: <xsl:value-of select="$add-color"/> }
div.diff-del  { text-decoration: line-through }
div.diff-chg  { background-color: <xsl:value-of select="$chg-color"/> }
div.diff-off  {  }

span.diff-add { background-color: <xsl:value-of select="$add-color"/> }
span.diff-del { text-decoration: line-through }
span.diff-chg { background-color: <xsl:value-of select="$chg-color"/> }
span.diff-off {  }

td.diff-add   { background-color: <xsl:value-of select="$add-color"/> }
td.diff-del   { text-decoration: line-through }
td.diff-chg   { background-color: <xsl:value-of select="$chg-color"/> }
td.diff-off   {  }
</xsl:if>
<xsl:text>
dd.indent { margin-left: 2em; }
p.element-syntax { border: solid thin; background-color: #ffccff }
div.proto { border: solid thin; background-color: #ffccff }
div.example { border: solid thin; background-color: turquoise; padding: 1em }
span.verb { font: small-caps 100% sans-serif } 
span.error { font-size: small } 
</xsl:text>
</xsl:param>

<xsl:param name="additional.title">
  <xsl:if test="$show.diff.markup != '0'">
    <xsl:text>Review Version</xsl:text>
  </xsl:if>
</xsl:param>

<xsl:param name="called.by.diffspec">1</xsl:param>

<!-- ==================================================================== -->

  <!-- spec: the specification itself -->
  <xsl:template match="spec">
    <html>
      <xsl:if test="header/langusage/language">
        <xsl:attribute name="lang">
          <xsl:value-of select="header/langusage/language/@id"/>
        </xsl:attribute>
      </xsl:if>
      <head>
        <title>
          <xsl:apply-templates select="header/title"/>
          <xsl:if test="header/version">
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="header/version"/>
          </xsl:if>
          <xsl:if test="$additional.title != ''">
            <xsl:text> -- </xsl:text>
            <xsl:value-of select="$additional.title"/>
	  </xsl:if>
        </title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <xsl:if test="$show.diff.markup != '0'">
          <div>
            <p>The presentation of this document has been augmented to
            identify changes from a previous version. Three kinds of changes
            are highlighted: <span class="diff-add">new, added text</span>,
            <span class="diff-chg">changed text</span>, and
            <span class="diff-del">deleted text</span>.</p>
            <hr/>
          </div>
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:if test="//footnote[not(ancestor::table)]">
          <hr/>
          <div class="endnotes">
            <xsl:text>&#10;</xsl:text>
            <h3>
              <xsl:call-template name="anchor">
                <xsl:with-param name="conditional" select="0"/>
                <xsl:with-param name="default.id" select="'endnotes'"/>
              </xsl:call-template>
              <xsl:text>End Notes</xsl:text>
            </h3>
            <dl>
              <xsl:apply-templates select="//footnote[not(ancestor::table)]"
                                   mode="notes"/>
            </dl>
          </div>
        </xsl:if>
      </body>
    </html>
  </xsl:template>

<!-- ==================================================================== -->

<xsl:template name="diff-markup">
  <xsl:param name="diff">off</xsl:param>
  <xsl:choose>
    <xsl:when test="ancestor::scrap">
      <!-- forget it, we can't add stuff inside tables -->
      <!-- handled in base stylesheet -->
      <xsl:apply-imports/>
    </xsl:when>
    <xsl:when test="self::gitem or self::bibl">
      <!-- forget it, we can't add stuff inside dls; handled below -->
      <xsl:apply-imports/>
    </xsl:when>
    <xsl:when test="ancestor-or-self::phrase">
      <span class="diff-{$diff}">
	<xsl:apply-imports/>
      </span>
    </xsl:when>
    <xsl:when test="ancestor::p and not(self::p)">
      <span class="diff-{$diff}">
	<xsl:apply-imports/>
      </span>
    </xsl:when>
    <xsl:when test="ancestor-or-self::affiliation">
      <span class="diff-{$diff}">
	<xsl:apply-imports/>
      </span>
    </xsl:when>
    <xsl:when test="ancestor-or-self::name">
      <span class="diff-{$diff}">
	<xsl:apply-imports/>
      </span>
    </xsl:when>
    <xsl:otherwise>
      <div class="diff-{$diff}">
	<xsl:apply-imports/>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*[@diff='chg' and $show.diff.markup='1' and (string(@at) &gt; $baseline or not(@at))]"
              priority="3">
  <xsl:call-template name="diff-markup">
	<xsl:with-param name="diff">chg</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="*[@diff='add' and $show.diff.markup='1' and (string(@at) &gt; $baseline or not(@at))]"
              priority="3">
  <xsl:call-template name="diff-markup">
	<xsl:with-param name="diff">add</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="*[@diff='del' and $show.diff.markup='1' and (string(@at) &gt; $baseline or not(@at))]" 
              priority="3">
  <xsl:call-template name="diff-markup">
	<xsl:with-param name="diff">del</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="*[@diff='del']" priority="2"/>
<xsl:template match="*[@diff='del']" mode="text" priority="2"/>
<xsl:template match="*[@diff='del']" mode="toc" priority="2"/>

<xsl:template match="*[@diff='off' and $show.diff.markup='1' and (string(@at) &gt; $baseline or not(@at))]">
  <xsl:call-template name="diff-markup">
	<xsl:with-param name="diff">off</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- ================================================================= -->

  <xsl:template match="bibl[@diff]" priority="1">
    <xsl:variable name="dt">
      <xsl:if test="@id">
	<a name="{@id}"/>
      </xsl:if>
      <xsl:choose>
	<xsl:when test="@key">
	  <xsl:value-of select="@key"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="@id"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="dd">
      <xsl:apply-templates/>
      <xsl:if test="@href">
        <xsl:text>  (See </xsl:text>
        <a href="{@href}">
          <xsl:value-of select="@href"/>
        </a>
        <xsl:text>.)</xsl:text>
      </xsl:if>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="@diff and $show.diff.markup = '1'">
	<dt class="label">
	  <span class="diff-{@diff}">
	    <xsl:copy-of select="$dt"/>
	  </span>
	</dt>
	<dd>
	  <div class="diff-{@diff}">
	    <xsl:copy-of select="$dd"/>
	  </div>
	</dd>
      </xsl:when>
      <xsl:when test="@diff='del' and $show.diff.markup='0'">
	<!-- suppressed -->
      </xsl:when>
      <xsl:otherwise>
	<dt class="label">
	  <xsl:copy-of select="$dt"/>
	</dt>
	<dd>
	  <xsl:copy-of select="$dd"/>
	</dd>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gitem/label">
    <xsl:variable name="diffval" select="ancestor-or-self::*/@diff"/>
    <xsl:choose>
      <xsl:when test="$diffval != '' and $show.diff.markup='1'">
	<dt class="label">
	  <span class="diff-{ancestor-or-self::*/@diff}">
	    <xsl:apply-templates/>
	  </span>
	</dt>
      </xsl:when>
      <xsl:when test="$diffval='del' and $show.diff.markup='0'">
	<!-- suppressed -->
      </xsl:when>
      <xsl:otherwise>
	<dt class="label">
	  <xsl:apply-templates/>
	</dt>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gitem/def">
    <xsl:variable name="diffval" select="ancestor-or-self::*/@diff"/>
    <xsl:choose>
      <xsl:when test="$diffval != '' and $show.diff.markup='1'">
	<dd>
	  <div class="diff-{ancestor-or-self::*/@diff}">
	    <xsl:apply-templates/>
	  </div>
	</dd>
      </xsl:when>
      <xsl:when test="$diffval='del' and $show.diff.markup='0'">
	<!-- suppressed -->
      </xsl:when>
      <xsl:otherwise>
	<dd>
	  <xsl:apply-templates/>
	</dd>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- authlist: list of authors (editors, really) -->
  <!-- called in enforced order from header's template, in <dl>
       context -->
  <xsl:template match="authlist[@diff]">
    <xsl:choose>
      <xsl:when test="$show.diff.markup='1'">
	<dt>
	  <span class="diff-{ancestor-or-self::*/@diff}">
	    <xsl:text>Editor</xsl:text>
	    <xsl:if test="count(author) > 1">
	      <xsl:text>s</xsl:text>
	    </xsl:if>
	    <xsl:text>:</xsl:text>
	  </span>
	</dt>
      </xsl:when>
      <xsl:when test="@diff='del' and $show.diff.markup='0'">
	<!-- suppressed -->
      </xsl:when>
      <xsl:otherwise>
	<dt>
	  <xsl:text>Editor</xsl:text>
	  <xsl:if test="count(author) > 1">
	    <xsl:text>s</xsl:text>
	  </xsl:if>
	  <xsl:text>:</xsl:text>
	</dt>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- author: an editor of a spec -->
  <!-- only appears in authlist -->
  <!-- called in <dl> context -->
  <xsl:template match="author[@diff]" priority="1">
    <xsl:choose>
      <xsl:when test="@diff and $show.diff.markup='1'">
	<dd>
	  <span class="diff-{ancestor-or-self::*/@diff}">
	    <xsl:apply-templates/>
	    <xsl:if test="@role = '2e'">
	      <xsl:text> - Second Edition</xsl:text>
	    </xsl:if>
	  </span>
	</dd>
      </xsl:when>
      <xsl:when test="@diff='del' and $show.diff.markup='0'">
	<!-- suppressed -->
      </xsl:when>
      <xsl:otherwise>
	<dd>
	  <xsl:apply-templates/>
	  <xsl:if test="@role = '2e'">
	    <xsl:text> - Second Edition</xsl:text>
	  </xsl:if>
	</dd>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
