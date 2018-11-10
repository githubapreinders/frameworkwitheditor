<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" method="xml" indent="no"/>
	
	<xsl:param name="otap"/>
	
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="contains(loginDetails/email, '.demo@priooo.com') and $otap = 'LOC'">
				<Demo/>
			</xsl:when>
			<xsl:when test="contains(loginDetails/email, '.demo@priooo.com') and $otap = 'ACC'">
				<Demo/>
			</xsl:when>
			<xsl:otherwise>
				<Login/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>		