import com.sap.gateway.ip.core.customdev.util.Message;
import groovy.util.Node;
import java.util.HashMap;

def Message processData(Message message) {
    
    def body = message.getBody(java.lang.String) as String;
    StringBuffer queryFilter = new StringBuffer();
    StringBuffer externalCodeString = new StringBuffer();
    def xmlNode = new XmlParser().parseText(body);
    
    xmlNode.each(){ externalCodeNode ->
        def lv_externalCode = externalCodeNode.text();
        externalCodeString.append(lv_externalCode + ",")
    }
    
    
    if(!(externalCodeString.toString().trim().isEmpty())){
        
        String[] externalCodeGroup = externalCodeString.toString().split(',');
        for(int i=0;i<externalCodeGroup.length;i++){
            if(i == externalCodeGroup.length-1){
		       queryFilter.append("externalCode eq "+ externalCodeGroup[i] + "");
		   }else{
		       queryFilter.append("externalCode eq "+ externalCodeGroup[i] + " or ");
		   }
        }
    }
    
    message.setProperty('queryFilter', queryFilter.toString());

    def messageLog = messageLogFactory.getMessageLog(message);
    messageLog.addAttachmentAsString("queryFilter", queryFilter.toString(), "text/plain");
    
    return message;
}