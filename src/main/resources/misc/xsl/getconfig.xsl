<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
<xsl:template match="/">
	<JSONMONSTER>
		<xsl:apply-templates select="result/rowset/row"/>
	</JSONMONSTER>
</xsl:template>
  <xsl:template match="row">
          <MYMONSTER>
              <xsl:value-of select="field[@name='CONFIG']"/>
          </MYMONSTER>
  </xsl:template>
</xsl:stylesheet>