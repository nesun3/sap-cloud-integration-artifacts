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

def Message processData(Message message) {
	
	//Body 
	def body = message.getBody();
	
	def map = message.getHeaders();
	
	SAXBuilder builder = new SAXBuilder();
	
	InputStream stream = new ByteArrayInputStream(body.getBytes("UTF-8"));
	
	Document doc = builder.build(stream);

	StringBuffer str = new StringBuffer();
	
	//def var_filter = buildXpathQuery(message)
	def var_filter = "/queryCompoundEmployeeResponse/CompoundEmployee"
	//str.append("The following records either have mandatory fields missing or do not satisfy field restrictions. \n\n")
	//str.append('<?xml version="1.0" encoding="UTF-8"?><queryCompoundEmployeeResponse>')
	str.append(evaluateXpath(body,var_filter))
	//str.append('</queryCompoundEmployeeResponse>')
	message.setBody(str.toString());
	//message.setBody(var_filter)
	return message;
	}
	
def evaluateXpath( String xml, String xpathQuery) {

  	def xpath = XPathFactory.newInstance().newXPath()
  	def builder     = DocumentBuilderFactory.newInstance().newDocumentBuilder()
  	InputSource is = new InputSource(new StringReader(xml));
  	
  	def records     = builder.parse(is)
  	
  	org.w3c.dom.NodeList l = (org.w3c.dom.NodeList)xpath.evaluate( xpathQuery, records,XPathConstants.NODESET)
	def xmlString = new StringBuffer();
	
	for (int i = 0; i < l.getLength(); i++) {
	def missingString = new StringBuffer("");
	
	if(xpath.evaluate("string-length(person/person_id_external)>19",l.item(i),XPathConstants.BOOLEAN))
  	missingString.append("person/person_id_external length should be less than or equal to 19 characters \n")
  	
	if(!xpath.evaluate("person/date_of_birth",l.item(i),XPathConstants.NODE))
	missingString.append("person/date_of_birth missing \n")
	
	if(!xpath.evaluate("person/national_id_card/national_id",l.item(i),XPathConstants.NODE))
	missingString.append("person/national_id_card/national_id missing \n")
	
	if(!xpath.evaluate("string-length(person/national_id_card/national_id)!=9",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/national_id_card/national_id length should be equal to 9 characters \n")
	
	if(xpath.evaluate("string-length(person/personal_information/middle_name)>50",l.item(i),XPathConstants.BOOLEAN))
  	missingString.append("person/personal_information/middle_name length should be less than or equal to 50 characters \n")
  	
	if(!xpath.evaluate("person/personal_information/last_name",l.item(i),XPathConstants.NODE))
	missingString.append("person/personal_information/last_name missing \n")
	
	if(xpath.evaluate("string-length(person/personal_information/last_name)>50",l.item(i),XPathConstants.BOOLEAN))
  	missingString.append("person/personal_information/last_name length should be less than or equal to 50 characters \n")
  	
	if(!xpath.evaluate("person/personal_information/first_name",l.item(i),XPathConstants.NODE))
	missingString.append("person/personal_information/first_name missing \n")
	
	if(xpath.evaluate("string-length(person/personal_information/first_name)>50",l.item(i),XPathConstants.BOOLEAN))
  	missingString.append("person/personal_information/first_name length should be less than or equal to 50 characters \n")
  	
	if(!xpath.evaluate("person/personal_information/gender",l.item(i),XPathConstants.NODE))
	missingString.append("person/personal_information/gender missing \n")
	
	if(xpath.evaluate("person/personal_information/gender",l.item(i),XPathConstants.NODE) && xpath.evaluate("string-length(person/personal_information/gender)!=1",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/personal_information/gender length should be equal to 1 character \n")
	
	if(!xpath.evaluate("person/employment_information/start_date",l.item(i),XPathConstants.NODE))
	missingString.append("person/employment_information/start_date missing \n")
	
	if(!xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']",l.item(i),XPathConstants.NODE))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home'] missing \n")
	
	if(!xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/city",l.item(i),XPathConstants.NODE))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/city missing \n")
	
	if(xpath.evaluate("string-length(person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/city)>50",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/city length should be less than 50 characters. \n")
	
	if(!xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/state",l.item(i),XPathConstants.NODE) && !xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/province",l.item(i),XPathConstants.NODE))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/state and person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/province missing. Atleast one is mandatory \n")
	
	def state="";
	if(xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/state",l.item(i),XPathConstants.NODE))
		state="S";
	else if(xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/province",l.item(i),XPathConstants.NODE))
		state="P";
	
	if(state == "S" && xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/state",l.item(i),XPathConstants.NODE) && xpath.evaluate("string-length(person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/state)!=2",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/state length should be equal to 2 characters. \n")
	
	else if(state == "P" && xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/province",l.item(i),XPathConstants.NODE) && xpath.evaluate("string-length(person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/province)!=2",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/province length should be equal to 2 characters. \n")
	
	if(!xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/country",l.item(i),XPathConstants.NODE))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/country missing \n")
	
	if(xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/country",l.item(i),XPathConstants.NODE) && xpath.evaluate("string-length(person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/country)!=3",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/country length should be equal to 3 characters. \n")
	
	if(!xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/address1",l.item(i),XPathConstants.NODE))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/address1 missing \n")
	
	if(xpath.evaluate("string-length(person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/address1)>50",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/address1 length should be less than 50 characters. \n")
	
	if(xpath.evaluate("string-length(person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/address2)>50",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/address2 length should be less than 50 characters. \n")
	
	if(!xpath.evaluate("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/zip_code",l.item(i),XPathConstants.NODE))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/zip_code missing \n")
	
	if(xpath.evaluate("string-length(person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/zip_code)>10",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/address_information[address_type='home' or address_type='HOME' or address_type='Home']/zip_code length should be less than or equal to 10 characters. \n")
	
	if(xpath.evaluate("string-length(person/email_information[email_type='P' or email_type='p']/email_address)>50",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/email_information[email_type='P' or email_type='p']/email_address length should be less than or equal to 50 characters. \n")
	
	if(xpath.evaluate("string-length(person/email_information[email_type='B' or email_type='b']/email_address)>50",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/email_information[email_type='B' or email_type='b']/email_address length should be less than or equal to 50 characters. \n")
	
	if(xpath.evaluate("string-length(person/employment_information/compensation_information/payroll_id)>50",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("person/employment_information/compensation_information/payroll_id length should be less than or equal to 50 characters. \n")
	
	if(xpath.evaluate("string-length(AnnualSalary)>11",l.item(i),XPathConstants.BOOLEAN))
	missingString.append("Salary length should be less than or equal to 11 digits. \n")
	
	if(!missingString.toString().equals("")){
	xmlString.append("Person ID: " + xpath.evaluate("person/person_id_external/text()",l.item(i),XPathConstants.STRING) + "\n")
	xmlString.append(missingString.toString() + "\n")
	}
	}
	def xmlString1 = xmlString.toString();
	
}

def nodeToString(org.w3c.dom.Node node) {
    StringWriter sw = new StringWriter();
      Transformer t = TransformerFactory.newInstance().newTransformer();
      t.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
      t.setOutputProperty(OutputKeys.INDENT, "yes");
      t.transform(new DOMSource(node), new StreamResult(sw));
      def xmlString = sw.toString();
  }

//An XpathQuery is built composed of custom filters and filters that take external parameters as inputs.
def buildXpathQuery(Message message){
	def map = message.getHeaders()
	def pMap = message.getProperties()
	def var_filter_query = new StringBuffer()
	def custom_filter_property =  pMap.get("custom_filter");
	
	def custom_filter_list = custom_filter_property.split(";");
	var_filter_query.append("(")
	for(int i=0;i<custom_filter_list.length;i++)
	{
	def custom_filter = custom_filter_list[i]
	
	if(custom_filter.contains("!"))
		
		{
			def custom_filter_operands = custom_filter.split("!=")
			if(custom_filter_operands[1].contains(","))
				
				{
					def custom_filter_comma_separated_values = custom_filter_operands[1].split(",")
					var_filter_query.append("(")
					for(int j=0; j<custom_filter_comma_separated_values.length;j++)
					{
						var_filter_query.append(custom_filter_operands[0]+"!="+"'"+custom_filter_comma_separated_values[j]+"'")	
						if(j!=custom_filter_comma_separated_values.length-1)
						{
							var_filter_query.append(" and ")
						}
					}
					var_filter_query.append(")")
				}
			else var_filter_query.append("("+custom_filter_operands[0]+"!='"+custom_filter_operands[1]+"')")
					
		}
	
	else	
		{
			def custom_filter_operands = custom_filter.split("=")
			if(custom_filter_operands[1].contains(","))
				
				{
					def custom_filter_comma_separated_values = custom_filter_operands[1].split(",")
					var_filter_query.append("(")
					for(int j=0; j<custom_filter_comma_separated_values.length;j++)
					{
						var_filter_query.append(custom_filter_operands[0]+"="+"'"+custom_filter_comma_separated_values[j]+"'")	
						if(j!=custom_filter_comma_separated_values.length-1)
						
						{
							var_filter_query.append(" or ")
						}
					}
					var_filter_query.append(")")
				}
			else var_filter_query.append("("+custom_filter_operands[0]+"='"+custom_filter_operands[1]+"')")
		}
		if(i!=custom_filter_list.length-1)
		{
			var_filter_query.append(" and ")
		}
		else var_filter_query.append(")")
	}
/*	if(pMap.get("company")!='')
	var_filter_query.append(" and "+parseExternalProperty("person/employment_information/job_information/company",pMap.get("company")))
	
	if(pMap.get("business_unit")!='')
	var_filter_query.append(" and "+parseExternalProperty("person/employment_information/job_information/business_unit",pMap.get("business_unit")))
	
	if(pMap.get("employment_type")!='')
	var_filter_query.append(" and "+parseExternalProperty("person/employment_information/job_information/employment_type",pMap.get("employment_type")))
	
	if(pMap.get("employee_class")!='')
	var_filter_query.append(" and "+parseExternalProperty("person/employment_information/job_information/employee_class",pMap.get("employee_class")))
	
	if(pMap.get("pay_group")!='')
	var_filter_query.append(" and "+parseExternalProperty("person/employment_information/job_information/pay_group",pMap.get("pay_group")))
	
	if(pMap.get("location")!='')
	var_filter_query.append(" and "+parseExternalProperty("person/employment_information/job_information/location",pMap.get("location")))
	
	var_filter_query.append(" and person/employment_information/job_information/company_territory_code = 'USA'")
*/	
	def XpathQuerySB="/queryCompoundEmployeeResponse/CompoundEmployee["+var_filter_query.toString()+"]"
	
}

//Unused function. Before I knew xpath contains could be used in Content Filter
def parseExternalProperty(String lhs, String property){
	def var_filter_SB = new StringBuffer() 
	if (property!="")
	{
		if(property.contains(",")){
		  def propertyList=property.split(",")
		  var_filter_SB.append("(")
		  for(int i=0;i<propertyList.length;i++){
		  	var_filter_SB.append(lhs+" = "+"'"+propertyList[i]+"'")
		  	if (i!=propertyList.length-1)
		  	var_filter_SB.append(" or ")
		  }
		  var_filter_SB.append(")")
		}
	 else var_filter_SB.append(lhs+" = "+"'"+property+"'")
	}
	else var_filter_SB.append("")
	}

  