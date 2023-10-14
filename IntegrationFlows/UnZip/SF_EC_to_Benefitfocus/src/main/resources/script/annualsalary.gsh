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
import java.io.StringWriter;
import org.xml.sax.InputSource;
import javax.xml.xpath.*;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.*;
import javax.xml.transform.TransformerFactory;  
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.dom.DOMSource;
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
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import java.util.Collections; 
import java.util.HashMap;
import java.lang.Number;

def Message processData(Message message) {
	
	//Body 
	def body = message.getBody();
	
	def pMap = message.getProperties();
	def includedPayComponents = pMap.get("includedPayComponents");
	
	
	
	StringBuffer str = new StringBuffer();
	
	SAXBuilder builder = new SAXBuilder();
	
	InputStream stream = new ByteArrayInputStream(body.getBytes("UTF-8"));
	
	Document doc = builder.build(stream);

	List<Element> CompoundEmployeeList = doc.getRootElement().getChildren("CompoundEmployee");

	XMLOutputter outp = new XMLOutputter();
	str.append("<queryCompoundEmployeeResponse>")
	for(Element CompoundEmployee:CompoundEmployeeList) {

		def xmlString = outp.outputString(CompoundEmployee)
		def standardHours = processXml(xmlString,"/CompoundEmployee/person/employment_information/job_information/standard_hours/text()");
		//String compundid = processXml(xmlString,"/CompoundEmployee/id/text()");
		//System.err.println("Compound id: "+compundid);
		
		if (standardHours != null && !standardHours.isEmpty()){
		
			def standHours = Float.parseFloat(standardHours);
			//str.append(String.valueOf("Inside "+standardHours+"\n ---"));
			def xpath = "/CompoundEmployee/person/employment_information/compensation_information/paycompensation_recurring";
	    	def annual_salary = calculateAnnualSalary(evaluateXpath(xmlString,xpath),includedPayComponents,standHours);
	    	CompoundEmployee.addContent(new Element("AnnualSalary").setText(annual_salary));
		}
		else
		{
			//str.append(String.valueOf("else block "+standardHours+"\n"));
			def xpath = "/CompoundEmployee/person/employment_information/compensation_information/paycompensation_recurring";
	    	def annual_salary = calculateAnnualSalary(evaluateXpath(xmlString,xpath),includedPayComponents,null);
	    	CompoundEmployee.addContent(new Element("AnnualSalary").setText(annual_salary));
		}
		
	    
		
	    str.append(outp.outputString(CompoundEmployee));	    	
	}
	str.append("</queryCompoundEmployeeResponse>")
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


def evaluateXpath( String xml, String xpathQuery) {

  	def xpath = XPathFactory.newInstance().newXPath()
  	def builder = DocumentBuilderFactory.newInstance().newDocumentBuilder()
  	InputSource is = new InputSource(new StringReader(xml));
  	
  	def records = builder.parse(is)
  	
  	org.w3c.dom.NodeList l = (org.w3c.dom.NodeList)xpath.evaluate( xpathQuery, records,XPathConstants.NODESET)
  	
	def xmlString = new StringBuffer();

  	HashMap<String,String> mapValues = new HashMap<String,String>();

	int count = 0;
	for (int i = 0; i < l.getLength(); i++) {

  		
  		def xpath1 = XPathFactory.newInstance().newXPath()
  		def builder1     = DocumentBuilderFactory.newInstance().newDocumentBuilder()
  		def inputStream1 = new ByteArrayInputStream( nodeToString(l.item(i)).bytes )
  		def records1     = builder1.parse(inputStream1).documentElement

		count++;
  		mapValues.put("payComponent"+count, xpath.evaluate("/paycompensation_recurring/pay_component/text()", records1 ));
  				
  		mapValues.put("paycompvalue"+count, xpath.evaluate("/paycompensation_recurring/paycompvalue/text()", records1 ));
  				
  		mapValues.put("payComponentType"+count,  xpath.evaluate("/paycompensation_recurring/pay_component_type/text()", records1 ));
  		
  		mapValues.put("annualizationFactor"+count, xpath.evaluate("/paycompensation_recurring/annualizationFactor/text()", records1 ));
	}
	HashMap<String,String> mapValues1 = mapValues;
}


def nodeToString(org.w3c.dom.Node node) {
      StringWriter sw = new StringWriter();
      Transformer t = TransformerFactory.newInstance().newTransformer();
      t.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
      t.setOutputProperty(OutputKeys.INDENT, "yes");
      t.transform(new DOMSource(node), new StreamResult(sw));
      def xmlString = sw.toString();
}

def calculateAnnualSalary(HashMap<String,String> mapValues, String includedPayComponents, def standardHours){
	

		float totalSalary = 0;
		float hourly=0;
		
		def payComponent1 = mapValues.get("payComponent1");		
		def paycompvalue1 = mapValues.get("paycompvalue1");
		
		if(paycompvalue1 !=null  && !paycompvalue1.isEmpty()){	
			paycompvalue1 = Float.parseFloat(paycompvalue1);
		}
		
		def annualizationFactor1 = mapValues.get("annualizationFactor1");
		if(annualizationFactor1 !=null  && !annualizationFactor1.isEmpty()){ 
			annualizationFactor1 = Float.parseFloat(annualizationFactor1);
		}
		
		def payComponentType1 = mapValues.get("payComponentType1");
		
		
		
		def payComponent2 = mapValues.get("payComponent2");		
		def paycompvalue2 = mapValues.get("paycompvalue2");
		
		if(paycompvalue2 !=null  && !paycompvalue2.isEmpty()){	
			paycompvalue2 = Float.parseFloat(paycompvalue2);
		}
		
		def annualizationFactor2 = mapValues.get("annualizationFactor2");
		if(annualizationFactor2 !=null && !annualizationFactor2.isEmpty()){ 
			annualizationFactor2 = Float.parseFloat(annualizationFactor2);
		}		
		def payComponentType2 = mapValues.get("payComponentType2");

		
		
		def payComponent3 = mapValues.get("payComponent3");		
		def paycompvalue3 = mapValues.get("paycompvalue3");
		
		if(paycompvalue3 !=null  && !paycompvalue3.isEmpty()){	
			paycompvalue3 = Float.parseFloat(paycompvalue3);
		}
		
		def annualizationFactor3 = mapValues.get("annualizationFactor3");
		if(annualizationFactor3 !=null  && !annualizationFactor3.isEmpty()){ 
			annualizationFactor3 = Float.parseFloat(annualizationFactor3);
		}
		def payComponentType3 = mapValues.get("payComponentType3");
		
		
		def payComponent4 = mapValues.get("payComponent4");		
		def paycompvalue4 = mapValues.get("paycompvalue4");
		
		if(paycompvalue4 !=null  && !paycompvalue4.isEmpty()){	
			paycompvalue4 = Float.parseFloat(paycompvalue4);
		}
		
		def annualizationFactor4 = mapValues.get("annualizationFactor4");
		if(annualizationFactor4 !=null  && !annualizationFactor4.isEmpty()){ 
			annualizationFactor4 = Float.parseFloat(annualizationFactor4);
		}
		def payComponentType4 = mapValues.get("payComponentType4");
		
		
		def payComponent5 = mapValues.get("payComponent5");		
		def paycompvalue5 = mapValues.get("paycompvalue5");
		
		if(paycompvalue5 !=null  && !paycompvalue5.isEmpty()){	
			paycompvalue5 = Float.parseFloat(paycompvalue5);
		}
		
		def annualizationFactor5 = mapValues.get("annualizationFactor5");
		if(annualizationFactor5 !=null  && !annualizationFactor5.isEmpty()){ 
			annualizationFactor5 = Float.parseFloat(annualizationFactor5);
		}
		def payComponentType5 = mapValues.get("payComponentType5");
		
		
		
		def payComponent6 = mapValues.get("payComponent6");		
		def paycompvalue6 = mapValues.get("paycompvalue6");
		
		if(paycompvalue6 !=null  && !paycompvalue6.isEmpty()){	
			paycompvalue6 = Float.parseFloat(paycompvalue6);
		}
		
		def annualizationFactor6 = mapValues.get("annualizationFactor6");
		if(annualizationFactor6 !=null  && !annualizationFactor6.isEmpty()){ 
			annualizationFactor6 = Float.parseFloat(annualizationFactor6);
		}
		def payComponentType6 = mapValues.get("payComponentType6");

		
		List payCompList = new ArrayList(); 
		if (includedPayComponents.trim().length()>0)
		{
		  String[] payComps = includedPayComponents.trim().split(",");
		  Collections.addAll(payCompList, payComps); 
		}
		//logger.info(payCompList.size() + " " + payCompList.contains(payComponent1));
		
		//Calculate the base salary + bonus
		//We count on annualizationFactor == 0 for hourly components
		
		if (paycompvalue1!=null && (payCompList.size()==0 || payCompList.contains(payComponent1)) && payComponentType1.toUpperCase()=="AMOUNT")
		{
		  if (annualizationFactor1==0) 
		  {
		     if (standardHours==null) throw new Exception("Job Standard Hours required to calculate annual salary");
		     totalSalary += paycompvalue1*standardHours*52;
		     hourly+=paycompvalue1;
		  }
		  else
		     totalSalary += paycompvalue1*annualizationFactor1;
		}
		
		if (paycompvalue2!=null && (payCompList.size()==0 || payCompList.contains(payComponent2)) && payComponentType2.toUpperCase()=="AMOUNT")
		{
		  if (annualizationFactor2==0) 
		  {
		     if (standardHours==null) throw new Exception("Job Standard Hours required to calculate annual salary");
		     totalSalary += paycompvalue2*standardHours*52;
		     hourly+=paycompvalue2;
		  }
		  else
		     totalSalary += paycompvalue2*annualizationFactor2;
		}
		
		if (paycompvalue3!=null && (payCompList.size()==0 || payCompList.contains(payComponent3)) && payComponentType3.toUpperCase()=="AMOUNT")
		{
		  if (annualizationFactor3==0) 
		  {
		     if (standardHours==null) throw new Exception("Job Standard Hours required to calculate annual salary");
		     totalSalary += paycompvalue3*standardHours*52;
		     hourly+=paycompvalue3;
		  }
		  else
		     totalSalary += paycompvalue3*annualizationFactor3;
		}
		
		if (paycompvalue4!=null && (payCompList.size()==0 || payCompList.contains(payComponent4)) && payComponentType4.toUpperCase()=="AMOUNT")
		{
		  if (annualizationFactor4==0) 
		  {
		     if (standardHours==null) throw new Exception("Job Standard Hours required to calculate annual salary");
		     totalSalary += paycompvalue4*standardHours*52;
		     hourly+=paycompvalue4;
		  }
		  else
		     totalSalary += paycompvalue4*annualizationFactor4;
		}
		
		if (paycompvalue5!=null && (payCompList.size()==0 || payCompList.contains(payComponent5)) && payComponentType5.toUpperCase()=="AMOUNT")
		{
		  if (annualizationFactor5==0) 
		  {
		     if (standardHours==null) throw new Exception("Job Standard Hours required to calculate annual salary");
		     totalSalary += paycompvalue5*standardHours*52;
		     hourly+=paycompvalue5;
		  }
		  else
		     totalSalary += paycompvalue5*annualizationFactor5;
		}
		
		if (paycompvalue6!=null && (payCompList.size()==0 || payCompList.contains(payComponent6)) && payComponentType6.toUpperCase()=="AMOUNT")
		{
		  if (annualizationFactor6==0) 
		  {
		     if (standardHours==null) throw new Exception("Job Standard Hours required to calculate annual salary");
		     totalSalary += paycompvalue6*standardHours*52;
		     hourly+=paycompvalue6;
		  }
		  else
		     totalSalary += paycompvalue6*annualizationFactor6;
		}
		
		//support only one percentage type
		//assumes that other components are base
		if (paycompvalue1!=null && (payCompList.size()==0 || payCompList.contains(payComponent1)) && payComponentType1.toUpperCase()=="PERCENTAGE")
		{
		  totalSalary += totalSalary*paycompvalue1*annualizationFactor1/100;
		}
		
		else if (paycompvalue2!=null && (payCompList.size()==0 || payCompList.contains(payComponent2)) && payComponentType2.toUpperCase()=="PERCENTAGE")
		{
		  totalSalary += totalSalary*paycompvalue2*annualizationFactor2/100;
		}
		
		else if (paycompvalue3!=null && (payCompList.size()==0 || payCompList.contains(payComponent3)) && payComponentType3.toUpperCase()=="PERCENTAGE")
		{
		  totalSalary += totalSalary*paycompvalue3*annualizationFactor3/100;
		}
		
		else if (paycompvalue4!=null && (payCompList.size()==0 || payCompList.contains(payComponent4)) && payComponentType4.toUpperCase()=="PERCENTAGE")
		{
		  totalSalary += totalSalary*paycompvalue4*annualizationFactor4/100;
		}
		
		else if (paycompvalue5!=null && (payCompList.size()==0 || payCompList.contains(payComponent5)) && payComponentType5.toUpperCase()=="PERCENTAGE")
		{
		  totalSalary += totalSalary*paycompvalue5*annualizationFactor5/100;
		}
		
		else if (paycompvalue6!=null && (payCompList.size()==0 || payCompList.contains(payComponent6)) && payComponentType6.toUpperCase()=="PERCENTAGE")
		{
		  totalSalary += totalSalary*paycompvalue6*annualizationFactor6/100;
		}	
		
	
	def returnStr = String.valueOf(totalSalary);
}
