<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output omit-xml-declaration="yes" method="xml"/>
<xsl:param name="email"/>
<xsl:param name="firstname"/>
<xsl:param name="lastname"/>
<xsl:param name="templateid2"/>

<xsl:template match="/">
<email>
     <recipients>
             <recipient type="to">apreinders74@gmail.com</recipient>
     </recipients>
     <from>ap@integrationpartners.nl</from>
     <subject>New user for Ibis4Education</subject>
     
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
	     <name>-email-</name>
	     <value><xsl:value-of select="$email"/></value>
	     </uniqueArgument>
	     
	    
     </uniqueArguments>
     
     <templateId>
     <xsl:value-of select="$templateid2"></xsl:value-of>
     </templateId>
</email>
</xsl:template>

</xsl:stylesheet> 
