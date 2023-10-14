import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;

def Message processData(Message message) {

	def body = message.getBody(java.lang.String) as String;

	// Log final confirmation payload after mapping
		def pmap = message.getProperties();
		String enableLogging = pmap.get("EnablePayloadLogging");
		
		if(enableLogging != null && enableLogging.toUpperCase().equals("TRUE")){	
			def messageLog = messageLogFactory.getMessageLog(message);
			if(messageLog != null){
			  messageLog.addAttachmentAsString("Payload_AfterXSLT", body, "text/xml");
			}
		}
	
	return message;
}