<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
		
	<xsl:param name="token"/>
	<xsl:param name="email"/>
	<xsl:template match="/">
		<AccessToken>
			<Token><xsl:value-of select="$token"/></Token>
			<CreationDate><xsl:value-of select="current-dateTime()"/></CreationDate>
			<Email><xsl:value-of select="$email"/></Email>
		</AccessToken>
	</xsl:template>
</xsl:stylesheet>
