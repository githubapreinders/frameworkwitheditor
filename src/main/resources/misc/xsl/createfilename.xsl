<xsl:stylesheet version="2.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output omit-xml-declaration="yes" indent="yes"/>
 
 	<xsl:param name="configName"/>
 	
 	<xsl:template match="/">
		<fileNames>
			<config><xsl:value-of select="$configName"/>/Configuration.xml</config>
			<build><xsl:value-of select="$configName"/>/BuildInfo_SC.properties</build>
		</fileNames>
 	</xsl:template>
</xsl:stylesheet>