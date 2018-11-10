<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output omit-xml-declaration="yes" method="xml"/>
<xsl:param name="email"/>
<xsl:param name="firstname"/>
<xsl:param name="lastname"/>
<xsl:param name="instancename"/>
<xsl:param name="password"/>
<xsl:param name="templateid"/>

<xsl:template match="/">
<email>
     <recipients>
             <recipient type="to"><xsl:value-of select="$email"/></recipient>
     </recipients>
     <from>ap@integrationpartners.nl</from>
     <subject>Your Ibis Editor credentials</subject>
     
     <message>
     <xsl:value-of select="message" />
     </message>
     <messageType>text/html</messageType>
     <messageBase64>false</messageBase64>
     <charset>UTF-8</charset>
     
     <uniqueArguments>
     
	     <uniqueArgument>
	     <name>-firstname-</name>
	     <value><xsl:value-of select="$firstname"/></value>
	     </uniqueArgument>
	     
	     <uniqueArgument>
	     <name>-lastname-</name>
	     <value><xsl:value-of select="$lastname"/></value>
	     </uniqueArgument>
	     
	     <uniqueArgument>
	     <name>-instancename-</name>
	     <value><xsl:value-of select="$instancename"/></value>
	     </uniqueArgument>
	     
	     <uniqueArgument>
	     <name>-password-</name>
	     <value><xsl:value-of select="$password"/></value>
	     </uniqueArgument>
	          
	
     </uniqueArguments>
     
     <templateId>
     <xsl:value-of select="$templateid"></xsl:value-of>
     </templateId>
</email>
</xsl:template>

</xsl:stylesheet> 
