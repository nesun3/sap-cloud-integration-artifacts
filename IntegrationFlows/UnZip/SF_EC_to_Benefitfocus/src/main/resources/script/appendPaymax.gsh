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
	def map = message.getProperties();
	SAXBuilder builder = new SAXBuilder();
	InputStream stream = message.getBody(java.io.InputStream);
	Document doc = builder.build(stream);
	
	def p = map.get("paymaxProperty");
	
	Element queryPaymaxResponse = doc.getRootElement();
	List<Element>paymaxList = queryPaymaxResponse.getChildren();
	
	XMLOutputter xml = new XMLOutputter();
	
	if(!paymaxList.isEmpty()){
		p.add(xml.outputString(doc));
	}
	
	return message;
}

