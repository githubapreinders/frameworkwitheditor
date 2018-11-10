<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
	
	<xsl:template match="/">
		<user>
			<role><xsl:value-of select="*/*/*/field[@name='ROLE']"/></role>
			<instancename><xsl:value-of select="*/*/*/field[@name='INSTANCENAME']"/></instancename>
			<firstname><xsl:value-of select="*/*/*/field[@name='FIRSTNAME']"/> </firstname>
			<lastname><xsl:value-of select="*/*/*/field[@name='LASTNAME']"/> </lastname>
		</user>
	
	</xsl:template>
</xsl:stylesheet>