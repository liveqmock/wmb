<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version='1.0'>

	<xsl:import href="docbook/fo/docbook.xsl" />
	<xsl:import href="highlighting/fo-highlighting.xsl" />
	<xsl:import href="common.xsl" />
	
	<xsl:param name="keep.relative.image.uris" select="1" />
	<xsl:param name="img.src.path">./</xsl:param>
	
	<xsl:param name="callout.graphics" select="1" />
	<xsl:param name="admon.graphics" select="0" />

	<xsl:param name="callout.graphics.extension">.svg</xsl:param>
	<xsl:param name="admon.graphics.extension">.png</xsl:param>
	<xsl:template match="*" mode="admon.graphic.width">
		<xsl:text>24pt</xsl:text>
	</xsl:template>
	
	<xsl:param name="fop1.extensions" select="1" />
	<!--
	<xsl:param name="fop.extensions">1</xsl:param>
	-->
	

	<xsl:param name="ulink.hyphenate">&#x200b;</xsl:param>
	<xsl:param name="ulink.hyphenate.chars">/&amp;?</xsl:param>

	<xsl:param name="paper.type">A4</xsl:param>
	<!--
	<xsl:param name="page.margin.inner">2cm</xsl:param>
	<xsl:param name="page.margin.outer">2cm</xsl:param>
	<xsl:param name="region.before.extent">0.88in</xsl:param>
	<xsl:param name="body.margin.top">0.93in</xsl:param>
	<xsl:param name="body.margin.bottom">0.83in</xsl:param>
	<xsl:param name="region.after.extent">0.78in</xsl:param>
	-->
	

	<xsl:param name="body.font.family">'Times','SimSun'</xsl:param>
	<!--
	<xsl:param name="body.font.master">10</xsl:param>
	<xsl:param name="footnote.font.size">9</xsl:param>
	-->
	
	<xsl:param name="title.font.family">'Helvetica','DroidSansFallback'</xsl:param>
	<xsl:param name="dingbat.font.family">'Helvetica','DroidSansFallback'</xsl:param>

	<xsl:param name="monospace.font.family">'DroidSansMono','DroidSansFallback'</xsl:param>
	<xsl:param name="sans.font.family">'Helvetica','DroidSansFallback'</xsl:param>


	<xsl:param name="section.label.includes.component.label" select="1" />
	<xsl:param name="section.autolabel" select="1" />
	<!-- 
	<xsl:param name="generate.toc">
		book toc,title
	</xsl:param>
	 -->


	<xsl:param name="draft.mode">no</xsl:param>

	<xsl:param name="ulink.footnotes" select="0" />
	<xsl:param name="ulink.show" select="0" />


	<xsl:attribute-set name="admonition.properties">
		<xsl:attribute name="font-family">''Helvetica'','GBZenKai-Medium'</xsl:attribute>
		<xsl:attribute name="font-size">90%</xsl:attribute>
		<xsl:attribute name="border-left-style">solid</xsl:attribute>
		<xsl:attribute name="border-left-color">black</xsl:attribute>
		<xsl:attribute name="border-left-width">1pt</xsl:attribute>
		<xsl:attribute name="padding-left">0em</xsl:attribute>
		<xsl:attribute name="margin-left">0em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="admonition.title.properties">
		<xsl:attribute name="font-family">'Helvetica','DroidSansFallback'</xsl:attribute>
		<xsl:attribute name="font-size">90%</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="color">#1c4c7d</xsl:attribute>

		<xsl:attribute name="border-left-style">solid</xsl:attribute>
		<xsl:attribute name="border-left-color">black</xsl:attribute>
		<xsl:attribute name="border-left-width">1pt</xsl:attribute>
		<xsl:attribute name="padding-left">0em</xsl:attribute>
		<xsl:attribute name="margin-left">0em</xsl:attribute>

		<xsl:attribute name="space-after">0pt</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="formal.title.properties">
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 0.9" />
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.properties">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#1c4c7d</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="component.title.properties">
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">#1c4c7d</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:param name="hyphenate.verbatim" select="1"/>

	<xsl:attribute-set name="monospace.verbatim.properties">
		<xsl:attribute name="font-size">7pt</xsl:attribute>
		<xsl:attribute name="wrap-option">wrap</xsl:attribute>
		<xsl:attribute name="hyphenation-character">\</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="verbatim.properties">
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 0.8" />
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.8em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">1em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">1.2em</xsl:attribute>
		<xsl:attribute name="padding">3pt</xsl:attribute>
	</xsl:attribute-set>

	<xsl:param name="shade.verbatim" select="1" />

	<xsl:attribute-set name="shade.verbatim.style">
		<xsl:attribute name="background-color">#f0f0f0</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="figure.properties">
		<xsl:attribute name="text-align">center</xsl:attribute>
	</xsl:attribute-set>
	
	<!-- 
	<xsl:attribute-set name="normal.para.spacing">
		<xsl:attribute name="text-indent">0em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">0em</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">0em</xsl:attribute>
	</xsl:attribute-set>
	-->

</xsl:stylesheet>