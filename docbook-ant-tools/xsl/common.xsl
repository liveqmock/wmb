<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version='1.0'>
	
	<xsl:param name="l10n.gentext.language" select="'en_US'" />
	<xsl:param name="callout.graphics.path">resources/callouts/</xsl:param>
	<xsl:param name="admon.graphics.path">resources/admonitions/</xsl:param>
	
	<xsl:param name="formal.title.placement">
		figure after
		example before
		equation before
		table before
		procedure before
	</xsl:param>
	
</xsl:stylesheet>