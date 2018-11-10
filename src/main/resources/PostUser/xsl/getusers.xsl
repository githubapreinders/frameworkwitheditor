<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" method="xml" indent="no"/>
	
	<xsl:template match="/">
		<users>
			<xsl:for-each select="result/rowset/row">
			<user>
				<firstname><xsl:value-of select="field[@name='FIRSTNAME']/text()"/></firstname>
				<lastname><xsl:value-of select="field[@name='LASTNAME']/text()"/></lastname>
				<email><xsl:value-of select="field[@name='EMAIL']/text()"/></email>
				<role><xsl:value-of select="field[@name='ROLE']/text()"/></role>
				<instancename><xsl:value-of select="field[@name='INSTANCENAME']/text()"/></instancename>
				<password><xsl:value-of select="field[@name='PASSWORD']/text()"/></password>
			</user>
			</xsl:for-each>
		</users>
	</xsl:template>
</xsl:stylesheet>	