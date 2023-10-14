import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;
import groovy.util.Node;
import groovy.xml.*;
import java.util.regex.*;
import java.io.*;

def Message processData(Message message) {

	def body = message.getBody(java.lang.String) as String;
	def pmap = message.getProperties();
	String enableLogging = pmap.get("EnablePayloadLogging");
	
	if(enableLogging != null && enableLogging.toUpperCase().equals("TRUE")){	
		def messageLog = messageLogFactory.getMessageLog(message);
		if(messageLog != null){
			messageLog.addAttachmentAsString("Payload", body, "text/xml");
		}
	}
		
	return message;
}
def Message LogException(Message message) {

	def body = message.getBody(java.lang.String) as String;
	def pmap = message.getProperties();
	String enableLogging = pmap.get("EnablePayloadLogging");
	
	if(enableLogging != null && enableLogging.toUpperCase().equals("TRUE")){	
		def messageLog = messageLogFactory.getMessageLog(message);
		if(messageLog != null){
			messageLog.addAttachmentAsString("LogException", body, "text/xml");
		    messageLog.addAttachmentAsString("dataStoreRecordID",  pmap.get("dataStoreRecordID"), "text/xml");
		}
	}
		
	return message;
}


def Message LogRequest(Message message) {

	def body = message.getBody(java.lang.String) as String;
	def pmap = message.getProperties();
	String enableLogging = pmap.get("EnablePayloadLogging");
	
	if(enableLogging != null && enableLogging.toUpperCase().equals("TRUE")){	
		def messageLog = messageLogFactory.getMessageLog(message);
		if(messageLog != null){
			messageLog.addAttachmentAsString("LogRequest Payload", body, "text/xml");
		}
	}
		
	return message;
}

def Message LogResponse(Message message) {

	def body = message.getBody(java.lang.String) as String;
	def pmap = message.getProperties();
	String enableLogging = pmap.get("EnablePayloadLogging");
	
	if(enableLogging != null && enableLogging.toUpperCase().equals("TRUE")){	
		def messageLog = messageLogFactory.getMessageLog(message);
		if(messageLog != null){
			messageLog.addAttachmentAsString("LogResponse Payload", body, "text/xml");
		}
	}
		
	return message;
}