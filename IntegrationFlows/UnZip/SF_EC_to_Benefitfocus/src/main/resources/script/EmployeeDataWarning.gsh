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
	//str.append("The following compound employees have been returned with some warnings.  \n\n")
	str.append(evaluateXpath(body,var_filter))
	message.setBody(str.toString());
	return message;
	}
	
def evaluateXpath( String xml, String xpathQuery) {

  	def xpath = XPathFactory.newInstance().newXPath()
  	def builder     = DocumentBuilderFactory.newInstance().newDocumentBuilder()
  	InputSource is = new InputSource(new StringReader(xml));
  	
  	def records     = builder.parse(is)
  	
  	org.w3c.dom.NodeList compEmpList = (org.w3c.dom.NodeList)xpath.evaluate( xpathQuery, records,XPathConstants.NODESET)
	def xmlString = new StringBuffer();
	
	for (int i = 0; i < compEmpList.getLength(); i++) 
		{
			xmlString.append("CompoundEmployee ID: " + xpath.evaluate("id/text()",compEmpList.item(i),XPathConstants.STRING) + "\n")
	 		org.w3c.dom.NodeList logItemList = (org.w3c.dom.NodeList)xpath.evaluate( "log/log_item", compEmpList.item(i),XPathConstants.NODESET)
		
			for(int j=0; j<logItemList.getLength(); j++)
				{
					
					org.w3c.dom.NodeList logItemNodes = logItemList.item(j).getChildNodes();
		
					for(int k=0; k < logItemNodes.getLength() ; k++)
						{	
							if(logItemNodes.item(k).getNodeType() == Node.ELEMENT_NODE)
							{
								xmlString.append(logItemNodes.item(k).getNodeName().toString() + " : " + logItemNodes.item(k).getTextContent() +"\n");
							}
						} 
					xmlString.append("\n");
				}
			xmlString.append("\n\n");
	
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

