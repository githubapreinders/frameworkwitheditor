<xsl:stylesheet version="2.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output omit-xml-declaration="yes" indent="yes"/>
 
 	<xsl:param name="timestamp"/>
 	<xsl:param name="version"/>
 	<xsl:param name="user"/>
 	
 	<xsl:template match="/">
		configuration.version=<xsl:value-of select="$version"/>
		configuration.timestamp=<xsl:value-of select="$timestamp"/>
		user.name=<xsl:value-of select="$user"/>
 	</xsl:template>
</xsl:stylesheet>	