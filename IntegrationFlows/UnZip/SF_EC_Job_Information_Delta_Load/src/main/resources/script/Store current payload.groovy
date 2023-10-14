import com.sap.gateway.ip.core.customdev.util.Message;
import groovy.xml.MarkupBuilder;
import groovy.util.Node;
import java.util.HashMap;

def Message processData(Message message) {

	def body = message.getBody(java.lang.String) as String;
	def xmlNode = new XmlParser().parseText(body);
	def pMap = message.getProperties();
	def writer = new StringWriter();
	def builder = new MarkupBuilder(writer);
	
	def lv_externalCode = xmlNode.externalCode.text();
	
	def currentDepartment = pMap.get("payload");
	def currentDepartmentNodes = new XmlParser().parseText(currentDepartment);
	def messageLog = messageLogFactory.getMessageLog(message)

	builder.FODepartment{
	    currentDepartmentNodes.FODepartment.findAll {
	        it.externalCode.text() == lv_externalCode
	    }.each{ currentDepartmentNode ->
	        def currentName = currentDepartmentNode.name_en_US.text();
	        def currentExternalCode = currentDepartmentNode.externalCode.text();
	        def currentEndDate = currentDepartmentNode.endDate.text();
	        def currentDescription = currentDepartmentNode.description_en_US.text();
	        def currentStartDate = currentDepartmentNode.startDate.text();
	        def currentLastModifiedOn = currentDepartmentNode.lastModifiedOn.text();
	        
	        'FODepartment'{
	            'name_en_US' currentName
                'externalCode' currentExternalCode
                'endDate' currentEndDate
                'description_en_US' currentDescription
                'startDate' currentStartDate
                'lastModifiedOn' currentLastModifiedOn
        	}
	    }
	    
	}
	
    message.setBody(writer.toString());
		
	return message;
}