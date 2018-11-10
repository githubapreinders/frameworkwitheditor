<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
	
	<xsl:param name="user"/>
	<xsl:param name="accesstoken"/>
	<xsl:template match="/">
	
		<logindetails>
			<accesstoken><xsl:value-of select="$accesstoken"/></accesstoken>
			<user>
				<id><xsl:value-of select="$user/*/*/*/field[@name='UID']"/></id>
				<xsl:choose>
					<xsl:when test="$user/*/*/*/field[@name='FIRSTNAME'] != ''">
						<firstname><xsl:value-of select="$user/*/*/*/field[@name='FIRSTNAME']"/></firstname>
					</xsl:when>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="$user/*/*/*/field[@name='LASTNAME'] != ''">
						<lastname><xsl:value-of select="$user/*/*/*/field[@name='LASTNAME']"/></lastname>
					</xsl:when>
				</xsl:choose>
				<instancename><xsl:value-of select="$user/*/*/*/field[@name='INSTANCENAME']"/></instancename>
				<role><xsl:value-of select="$user/*/*/*/field[@name='ROLE']"/></role>				
			</user>
		</logindetails>
	
	</xsl:template>
</xsl:stylesheet>