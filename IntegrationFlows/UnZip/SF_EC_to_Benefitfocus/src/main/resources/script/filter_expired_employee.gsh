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
	def body = message.getBody();
	
	//def messageLog = messageLogFactory.getMessageLog(message);
	
	def map = message.getProperties();
	def includeTerminations = map.get("includeTerminations");
	
	SAXBuilder builder = new SAXBuilder();
	
	InputStream stream = new ByteArrayInputStream(body.getBytes("UTF-8"));
	
	Document doc = builder.build(stream);

	StringBuffer str = new StringBuffer();

	List<Element> CompoundEmployeeList = doc.getRootElement().getChildren("CompoundEmployee");

	XMLOutputter outp = new XMLOutputter();
	
	def termExpired;
	int index=0;
	
	str.append("<queryCompoundEmployeeResponse>");
	
	for(Element CompoundEmployee:CompoundEmployeeList) {
		termExpired=false;
		
		def xmlString = outp.outputString(CompoundEmployee);
		
		def end_date = processXml(xmlString,"/CompoundEmployee/person/employment_information/end_date/text()");
		//messageLog.setStringProperty("end_date"+index,end_date);
		
		def emplStatus = processXml(xmlString,"/CompoundEmployee/person/employment_information/job_information/emplStatus/text()");
		//messageLog.setStringProperty("emplStatus"+index,emplStatus);
		
		if(end_date!=null && end_date.length() >0 && emplStatus!="A"){
			try 
			{
				int includeTerminationsInt = Integer.parseInt(includeTerminations); 
				//messageLog.setStringProperty("includeTerminationsInt",includeTerminationsInt.toString());
	
				Calendar calendar = Calendar.getInstance();
				
				calendar.setTime(new Date());
				calendar.add(Calendar.DAY_OF_YEAR, - includeTerminationsInt);
	
				//messageLog.setStringProperty("calendarDate",calendar.getTime().toString());
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date terminationDate = formatter.parse(end_date);
				
				//messageLog.setStringProperty("terminationDate"+index,terminationDate.toString());
				
				
				if(calendar.getTime().compareTo(terminationDate) > 0){
					termExpired=true;
				}else{
					termExpired=false;
				}
				 
			}catch(Exception e){
				termExpired=false;
			}	
		
		}
		
		if(termExpired == false){
			str.append(xmlString);
		}
		
		index++;
	}
	//messageLog.setStringProperty("strString",str.toString());
	str.append("</queryCompoundEmployeeResponse>");
	message.setBody(str.toString());
	return message;
}
	
def processXml( String xml, String xpathQuery) {

  	def xpath = XPathFactory.newInstance().newXPath()
  	def builder     = DocumentBuilderFactory.newInstance().newDocumentBuilder()
  	def inputStream = new ByteArrayInputStream( xml.bytes )
  	def records     = builder.parse(inputStream).documentElement
  	xpath.evaluate( xpathQuery, records ); 
}