import com.sap.gateway.ip.core.customdev.util.Message;
import groovy.xml.MarkupBuilder;
import groovy.util.Node;
import java.util.HashMap;
def Message processData(Message message) {
	def body = message.getBody(java.lang.String);
	def writer = new StringWriter();
	def builder = new MarkupBuilder(writer);
	def uniquekeyEmpJobContent = message.getProperty("repsonesKeys");
	def uniquekeyEmpJobNodes = new XmlParser().parseText(uniquekeyEmpJobContent);
	HashMap<String, String> deltawithKeyMap = new HashMap<String, String>();
	
	    def init = true;
	    def filterPersonId = new StringBuffer();

	       def deltaEmpJobNodes = new XmlParser().parseText(body);
	       // check the uniquekey
	        deltaEmpJobNodes.EmpJob.each{ deltaEmpJobNode ->
                def lv_deltaStartDate = deltaEmpJobNode.startDate.text();
                def lv_deltaseqNumber = deltaEmpJobNode.seqNumber.text();
                def lv_deltaUserId = deltaEmpJobNode.userId.text();
        
                def uniquekeyEmpJobNode = uniquekeyEmpJobNodes.value.find{
                    it.userId.text() == lv_deltaUserId && it.startDate.text() == lv_deltaStartDate && it.seqNumber.text() == lv_deltaseqNumber
                }
                        
                if(uniquekeyEmpJobNode == null){
                    return;
                    
                }else{
                    def uniquekeyEmpJobNode1 = uniquekeyEmpJobNodes.value.find{
                   it.userId.text() == lv_deltaUserId && it.startDate.text() == lv_deltaStartDate && it.seqNumber.text() == lv_deltaseqNumber
                    }
                    if(uniquekeyEmpJobNode1 != null){
                       
                         deltaEmpJobNode.uniquekey[0].value = uniquekeyEmpJobNode1.uniquekey.text();
                         deltawithKeyMap.put(uniquekeyEmpJobNode1.uniquekey.text(),deltaEmpJobNode);
                    }
                }
	       }
	       
	      
	   


	      def DeltaWithKeyXML = new StringBuffer();
   DeltaWithKeyXML.append("<EmpJob>");  
    	   for ( item in deltawithKeyMap ) {
    	    def stringWriter = new StringWriter()
    	    def xmlNodePrinter = new XmlNodePrinter(new PrintWriter(stringWriter));
    
                xmlNodePrinter.with {
                    preserveWhitespace = true

                }
              xmlNodePrinter.print(item.value);
    

             DeltaWithKeyXML.append(stringWriter.toString());
     
            }

		DeltaWithKeyXML.append("</EmpJob>");

	
	message.setProperty("DeltaEmpJobsWithKey",DeltaWithKeyXML.toString());


    message.setBody(DeltaWithKeyXML.toString());
    
    return message;
}