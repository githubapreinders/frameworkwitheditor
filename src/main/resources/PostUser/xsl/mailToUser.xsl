<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" indent="yes" />
	<xsl:param name="firstname"/>
	<xsl:param name="lastname"/>
	<xsl:param name="email"/>
	<xsl:param name="password"/>
	<xsl:param name="instancename"/>

	<xsl:template match="/">
		<email>
			<recipients>
				<recipient type="to"><xsl:value-of select="$email"/></recipient>
				<recipient type="bcc">ap@integrationpartners.nl</recipient>
			</recipients>
			<from>ap@integrationpartners.nl</from>
			<subject>
				Course Credentials for <span><xsl:value-of select="$firstname"/></span> <span><xsl:value-of select="$lastname"/></span>
			</subject>
			<message>

				<p><xsl:value-of select="$firstname"/> <xsl:value-of select="$lastname"/> </p>
				<p> Your login name : <xsl:value-of select="$email"/></p>
				<p> Your password : 	<xsl:value-of select="$password"/></p>
				<p> The name of your Ibis : 	<xsl:value-of select="$instancename"/></p>
			</message>
		</email>
	</xsl:template>
</xsl:stylesheet>