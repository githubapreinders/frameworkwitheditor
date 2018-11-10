<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
	
	<xsl:param name="therow"/>
	
	<xsl:template match="/">
		<returntag>
		
		<tag1>
			/result/rowset/row[<xsl:value-of select="$therow" />]/field/text()  
		</tag1>
		
			   
		</returntag>
	
	</xsl:template>
</xsl:stylesheet>