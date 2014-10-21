<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://icl.com/saxon"
                extension-element-prefixes="saxon"
                version='1.0'>

<xsl:import href="docbook/html/docbook.xsl" />
<xsl:import href="highlighting/html-highlighting.xsl" />
<xsl:import href="common.xsl" />

<xsl:param name="callout.graphics" select="0" />
<xsl:param name="admon.graphics" select="0" />

<xsl:param name="ignore.image.scaling" select="1" />

<xsl:output method="html" encoding="UTF-8" indent="yes" saxon:character-representation="native"/>

<xsl:param name="table.borders.with.css" select="0"/>
<xsl:param name="html.stylesheet">resources/style.css</xsl:param>
<xsl:param name="html.stylesheet.type">text/css</xsl:param>         
<xsl:param name="section.label.includes.component.label" select="1" /> 
<xsl:param name="section.autolabel" select="1" />
<!-- <xsl:param name="generate.toc">book toc,title</xsl:param> -->
<xsl:param name="make.graphic.viewport" select="0"/>



</xsl:stylesheet>


