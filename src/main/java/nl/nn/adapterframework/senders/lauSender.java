package nl.nn.adapterframework.senders;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import nl.nn.adapterframework.configuration.ConfigurationException;
import nl.nn.adapterframework.core.SenderException;
import nl.nn.adapterframework.core.SenderWithParametersBase;
import nl.nn.adapterframework.core.TimeOutException;
import nl.nn.adapterframework.parameters.ParameterResolutionContext;
import nl.nn.adapterframework.util.CredentialFactory;
import nl.nn.adapterframework.util.DomBuilderException;
import nl.nn.adapterframework.util.XmlUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.xerces.impl.dv.util.Base64;
import org.json.JSONException;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.sendgrid.*;

public class lauSender extends SenderWithParametersBase {	
	private String apiKey;
	private String fromName;

	public String sendMessage(String correlationID, String message,
			ParameterResolutionContext prc) throws SenderException,
			TimeOutException {
			String result = null;
			String templateId = null;
			Collection<Node> uniqueArguments = null;
			Collection<Node> recipients = null;
			Element recipient = null;
			Element emailElement;
		
	    try {    	
	    	SendGrid sg = new SendGrid(getApiKey());
	    	Mail mail = new Mail();
	        Personalization personalization = new Personalization();
	        
	        try {
				emailElement = XmlUtils.buildElement(message);
				
				// Add from
				String fromString = XmlUtils.getChildTagAsString(emailElement, "from");		
				if(fromString != null){
					Email from = new Email();
					from.setName(getFromName());
				    from.setEmail(fromString);
					mail.setFrom(from);
				}
				else{
					return "From cannot be null.";
				}
				
				// Add templateId
				templateId = XmlUtils.getChildTagAsString(emailElement, "templateId");
				if(templateId != null){
					mail.setTemplateId(templateId);
				}
				else {
					return "TemplateId cannot be null.";
				}
				
				// Add to
				Element recipientsElement = XmlUtils.getFirstChildTag(emailElement,
						"recipients");
				recipients = XmlUtils.getChildTags(recipientsElement, "recipient");	
				Iterator<Node> iters = recipients.iterator();
				
				while (iters.hasNext()) {
					recipient = (Element) iters.next();
					String recipientString = XmlUtils.getStringValue(recipient);
					
					if (StringUtils.isNotEmpty(recipientString)) {
						String typeAttr = recipient.getAttribute("type");
						Email to = new Email(recipientString);
						
						if ("cc".equalsIgnoreCase(typeAttr)) {
							personalization.addCc(to);
						} else if ("bcc".equalsIgnoreCase(typeAttr)) {
							personalization.addBcc(to);
						} else {
							personalization.addTo(to);
						}
					} else {
						log.debug(getLogPrefix() + "empty recipient found, ignoring");
					}
					
				}
				
				// Add replyTo
				String replyTo = XmlUtils.getChildTagAsString(emailElement, "replyTo");
				if(replyTo != null){
					Email replyToMail = new Email(replyTo);
					mail.setReplyTo(replyToMail);
				}
				
				// Add subject
				String subject = XmlUtils.getChildTagAsString(emailElement, "subject");
				personalization.setSubject(subject);
				
				// Add subs
				Element uniqueArgumentsElement = XmlUtils.getFirstChildTag(
						emailElement, "uniqueArguments");
				uniqueArguments = XmlUtils.getChildTags(uniqueArgumentsElement, "uniqueArgument");	
				
				Iterator<Node> iter = uniqueArguments.iterator();
				while (iter.hasNext()) {
					Node argumentElement = iter.next();
					String argumentName = XmlUtils.getChildTagAsString(
							(Element) argumentElement, "name");
					String argumentValue = XmlUtils.getChildTagAsString(
							(Element) argumentElement, "value");
						
					if(argumentName != null && argumentValue != null){
						personalization.addSubstitution(argumentName, argumentValue);
					}
				}
				
				// Add attachment
				String attachment = XmlUtils.getChildTagAsString(emailElement, "attachment");
				if(attachment != null ){
					Attachments attachments = new Attachments();
					System.out.println(attachment);
					attachments.setContent(attachment);
					attachments.setType("application/zip");
					attachments.setFilename("dump.zip");
					attachments.setDisposition("attachment");
					attachments.setContentId("Dump Zip");
					mail.addAttachments(attachments);
				}

			} catch (DomBuilderException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        	        	        
	        // Append personalization to mail
	        mail.addPersonalization(personalization);
	        
	        // Create request
	        Request request = new Request();
	        request.setMethod(Method.POST);
	        request.setEndpoint("mail/send");
	        request.setBody(mail.build());
	        
	        Response response = sg.api(request);
	        
	        // Print response
	        System.out.println(response.getStatusCode());
	        System.out.println(response.getBody());
	        System.out.println(response.getHeaders());	  

	    
	    } catch (IOException ex) {
	    	try {
				throw ex;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    
	    return result;
 
	}
	
	public void setApiKey(String string) {
		apiKey = string;
	}
	
	public String getApiKey() {
		return apiKey;
	}
	
	public void setFromName(String string) {
		fromName = string;
	}
	
	public String getFromName() {
		return fromName;
	}
}