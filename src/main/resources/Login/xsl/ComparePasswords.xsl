<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
		
	<xsl:param name="password"/>
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$password=*/*/*/field[@name='PASSWORD']">
				<result>match</result>
			</xsl:when>
			<xsl:otherwise>
				<result>There was no match.</result>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
