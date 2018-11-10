<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" indent="yes" />
	<xsl:param name="email"/>
	<xsl:param name="instancename"/>


	<xsl:template match="/">
		<tokeninfo>
			<username><xsl:value-of select="$email"/></username>
			<instancename><xsl:value-of select="$instancename"/></instancename>
		</tokeninfo>
	</xsl:template>
</xsl:stylesheet>
