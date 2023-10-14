import java.util.*;
import com.sap.it.api.mapping.*;
import com.sap.gateway.ip.core.customdev.util.Message;


def Message processData(Message message) {
	map = message.getProperties();
	property_EnableLogging = map.get("EnableLogging");
	message.setHeader("SAP_IsIgnoreProperties",new Boolean(true));
	
	if (property_EnableLogging.toUpperCase().equals("TRUE")) {	
		def body = message.getBody(java.lang.String) as String;
		def messageLog = messageLogFactory.getMessageLog(message);
		messageLog.addAttachmentAsString("Payload", body, "text/xml");
	}	
 
	return message;
}

