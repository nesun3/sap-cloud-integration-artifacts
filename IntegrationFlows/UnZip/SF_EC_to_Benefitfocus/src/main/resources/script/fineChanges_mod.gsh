/*
 * The integration developer needs to create the method processData 
 * This method takes Message object of package com.sap.gateway.ip.core.customdev.util
 * which includes helper methods useful for the content developer:
 * 
 * The methods available are:
    public java.lang.Object getBody()

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
import java.util.HashMap;
import org.xml.sax.InputSource;
import javax.xml.xpath.*;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.IOException;
import java.text.SimpleDateFormat
import java.util.HashMap;
import java.util.List;
import org.jdom.Content;
import org.jdom.Document;
import org.jdom.Element
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.XMLOutputter
import org.jdom.output.Format
import org.jaxen.JaxenException;
import org.jaxen.SimpleNamespaceContext;
import org.jaxen.XPath;
import org.jaxen.jdom.JDOMXPath
import org.jdom.Namespace;

def Message processData(Message message) {
	
	//Body 
	def body = message.getBody().toString();
	StringBuffer str = new StringBuffer();
	
	map = message.getProperties();
	String convertStorePayload = new String(map.get("storePayload"),"UTF-8");
	
	def storePayLoad = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><queryCompoundEmployeeResponse>"+convertStorePayload+"</queryCompoundEmployeeResponse>";
	def currentPayload = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><queryCompoundEmployeeResponse>"+map.get("currentPayload")+"</queryCompoundEmployeeResponse>";
	
	str.append("store payload  :"+ map.get("storePayload")+ "\n");
	//str.append("Current payload  :"+ currentPayload+ "\n");
	
	SAXBuilder builder = new SAXBuilder();
	
	InputStream stream = new ByteArrayInputStream(storePayLoad.getBytes("UTF-8"));
	
	Document doc = builder.build(stream);
	List<Element> CompoundEmployeeList = doc.getRootElement().getChildren("CompoundEmployee");

	XMLOutputter outp = new XMLOutputter();
	XMLOutputter outp_current = new XMLOutputter();
	
	//str.append("Compound employee length :"+ CompoundEmployeeList.size() + "\n");

	
	for(Element CompoundEmployee:CompoundEmployeeList) {
		
		def xmlString = outp.outputString(CompoundEmployee);
		def xpathQuery = "/CompoundEmployee/person/employment_information/employment_id/text()";
		def employment_id = processXml(xmlString,xpathQuery);
		
		str.append("Found id is :"+ employment_id+"\n");
		// compare
		def xpathQuery_current = "/queryCompoundEmployeeResponse/CompoundEmployee/person/employment_information/employment_id[text()='"+employment_id+"']";
		if(processXml(currentPayload,xpathQuery_current).trim().isEmpty()){
			str.append(xmlString);
		}
	}
	
	message.setBody(str.toString());
	return message;
	}
	
def processXml( String xml, String xpathQuery) {

  	def xpath = XPathFactory.newInstance().newXPath()
  	def builder     = DocumentBuilderFactory.newInstance().newDocumentBuilder()
  	def inputStream = new ByteArrayInputStream( xml.bytes )
  	def records     = builder.parse(inputStream).documentElement
  	//String valueAtXPath = xpath.evaluate( xpathQuery, records )
  	//compareDates(valueAtXPath);
  	xpath.evaluate( xpathQuery, records );
 
}
