<?xml version='1.0'?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                  xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.1">
  <xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl"/>
  <xsl:param name="draft.mode" select="'yes'"/>
  <xsl:param name="l10n.gentext.language" select="'zh_cn'"/> <!--本地化为简体中文-->
  <xsl:param name="body.font.family">'WenQuanYi Zen Hei'</xsl:param>
  <xsl:param name="monospace.font.family">'WenQuanYi Zen Hei'</xsl:param>
  <xsl:param name="title.font.family">'WenQuanYi Zen Hei'</xsl:param>
  <!--section 字体设置-->
  <xsl:attribute-set name="section.title.properties">
    <xsl:attribute name="font-family">'WenQuanYi Zen Hei'</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-style">normal</xsl:attribute>
  </xsl:attribute-set>
  <!--table 字体设置-->
  <xsl:attribute-set name="table.properties">
    <xsl:attribute name="font-family">'WenQuanYi Zen Hei'</xsl:attribute>
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="font-style">normal</xsl:attribute>
  </xsl:attribute-set>
  <xsl:param name="double.sided" select="1" /> <!--双面打印-->
  <!--解决Flow xsl-region-body does not map to the region-body in page-master blank 错误-->
  <xsl:param name="fop1.extensions" select="1"></xsl:param>
  <xsl:param name="body.start.indent">0pt</xsl:param> <!--正文不缩进-->
  <xsl:param name="line-height">1.5em</xsl:param> <!--行高-->
  <xsl:param name="bibliography.numbered" select="1" /> <!--参考资料加编号-->
  <xsl:param name="saxon.character.representation" select="'native'"/>
  <xsl:param name="admon.graphics" select="1"/>
  <xsl:param name="section.autolabel" select="1"/>
  <xsl:param name="section.label.includes.component.label" select="1"/>
  <xsl:param name="table.borders.with.css" select="1"/>
  <xsl:param name="use.extensions" select="1"/>
  <xsl:param name="tablecolumns.extension" select="0"/>
  <xsl:param name="callout.unicode" select="1"/>
  <xsl:param name="callout.unicode.start.character" select="10102"></xsl:param>
  <xsl:param name="variablelist.as.blocks" select="1"></xsl:param>
  <xsl:param name="callout.graphics" select="0"/>
  <xsl:param name="hyphenate">false</xsl:param>
  <xsl:param name="paper.type" select="'A4'"/>
  <xsl:param name="draft.mode" select="'no'"/>
  <!--旋转90度的图片，横向的图片-->
  <xsl:template match="figure[processing-instruction('landscapeFigure')]">
    <fo:block-container reference-orientation="90">
      <xsl:apply-imports/>
    </fo:block-container>
  </xsl:template>
  <!--列表左边距的设置-->
  <xsl:attribute-set name="list.block.spacing">
    <xsl:attribute name="margin-left">
      <xsl:choose>
        <xsl:when test="self::itemizedlist">0pt</xsl:when>
        <xsl:when test="self::variablelist">0pt</xsl:when>
        <xsl:otherwise>20pt</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="normal.para.spacing">
    <xsl:attribute name="text-indent">2em</xsl:attribute> <!--段首缩进-->
    <xsl:attribute name="space-before.optimum">0em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">0em</xsl:attribute>
  </xsl:attribute-set>
  <!--chapter、appendix、preface、article、index等标题间距-->
  <xsl:attribute-set name="component.title.properties">
    <xsl:attribute name="font-family">
      <xsl:value-of select="$title.font.family"/>
    </xsl:attribute>
    </xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <!-- font size is calculated dynamically by section.heading template -->
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="text-align">left</xsl:attribute>
    <xsl:attribute name="space-before.minimum">1.8em</xsl:attribute>
    <xsl:attribute name="space-before.optimum">2.0em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">2.2em</xsl:attribute>
    <xsl:attribute name="space-after.minimum">1.8em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">2.0em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">2.2em</xsl:attribute>
  </xsl:attribute-set>
  <!--Section标题间距-->
  <xsl:attribute-set name="section.title.properties">
    <xsl:attribute name="font-family">
      <xsl:value-of select="$title.font.family"/>
    </xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <!-- font size is calculated dynamically by section.heading template -->
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    <xsl:attribute name="text-align">left</xsl:attribute>
    <xsl:attribute name="space-before.minimum">1.8em</xsl:attribute>
    <xsl:attribute name="space-before.optimum">2.0em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">2.2em</xsl:attribute>
    <xsl:attribute name="space-after.minimum">1.8em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">2.0em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">2.2em</xsl:attribute>
  </xsl:attribute-set>
  <!--xsl:param name="generate.toc">
    appendix toc
    article/appendix nop
    article toc,title
    book toc,title
    chapter nop
    part toc,title
    preface toc,title
    qandadiv toc
    qandaset toc
    reference toc,title
    sect1 nop
    sect2 nop
    sect3 nop
    sect4 nop
    sect5 nop
    section nop
    set toc,title
  </xsl:param-->
  <xsl:param name="section.autolabel.max.depth" select="2"/> <!--只编号到sect2-->
</xsl:stylesheet>