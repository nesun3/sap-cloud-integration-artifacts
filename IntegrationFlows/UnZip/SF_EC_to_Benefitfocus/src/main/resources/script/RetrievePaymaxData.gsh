/*
 * The integration developer needs to create the method processData 
 * This method takes Message object of package com.sap.gateway.ip.core.customdev.util
 * which includes helper methods useful for the content developer:
 * 
 * The methods available are:
    public java.lang.Object getBody()
    
    //This method helps User to retrieve message body as specific type ( InputStream , String , byte[] ) - e.g. message.getBody(java.io.InputStream)
    public java.lang.Object getBody(java.lang.String fullyQualifiedClassName)

    public void setBody(java.lang.Object exchangeBody)

    public java.util.Map<java.lang.String,java.lang.Object> getHeaders()

    public void setHeaders(java.util.Map<java.lang.String,java.lang.Object> exchangeHeaders)

    public void setHeader(java.lang.String name, java.lang.Object value)

    public java.util.Map<java.lang.String,java.lang.Object> getProperties()

    public void setProperties(java.util.Map<java.lang.String,java.lang.Object> exchangeProperties) 

	public void setProperty(java.lang.String name, java.lang.Object value)
 * 
 */
import com.sap.gateway.ip.core.customdev.util.Message;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.*;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.dom.DOMSource;
import javax.xml.xpath.*;
import org.jaxen.JaxenException;
import org.jaxen.jdom.JDOMXPath
import org.jaxen.SimpleNamespaceContext;
import org.jaxen.XPath;
import org.jdom.Content;
import org.jdom.Document;
import org.jdom.Element
import org.jdom.input.SAXBuilder;
import org.jdom.JDOMException;
import org.jdom.Namespace;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import java.text.SimpleDateFormat;
import java.util.Date;

def Message processData(Message message) {
	
	//Body 
	def body = message.getBody();
	def map = message.getProperties();
	
	List<String> p = map.get("paymaxProperty");
	Element queryPaymaxResponse = new Element("queryPaymaxResponse");
	Document newDoc = new Document(queryPaymaxResponse);
	newDoc.setRootElement(queryPaymaxResponse);
	
	for(String entry : p){
		
		SAXBuilder builder = new SAXBuilder();
		InputStream stream = new ByteArrayInputStream(entry.getBytes("UTF-8"));
		Document doc = builder.build(stream);
		
		List<Element> paymaxList = doc.getRootElement().getChildren("paymax");
		for(Element pay : paymaxList){
			
			queryPaymaxResponse.addContent(pay.clone());
			
		}
		
	}
	
	if(p.size() == 0){
	    message.setProperty("noRecord","1");
	}
	else{
	    message.setProperty("noRecord","0");
	}
	
	message.setBody(new XMLOutputter().outputString(newDoc));
	
	return message;
}

