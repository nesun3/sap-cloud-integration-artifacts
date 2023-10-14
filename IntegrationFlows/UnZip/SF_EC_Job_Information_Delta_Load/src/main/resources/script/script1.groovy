import com.sap.gateway.ip.core.customdev.util.Message

import java.time.LocalDate

def Message processData(Message message) {

    def properties = message.getProperties();
    def filter = new StringBuffer();
    def body = message.getBody(java.lang.String) as String;
    def xmlNode = new XmlParser().parseText(body);
    
    def init = true;
    
    xmlNode.EmpJob.userId.each {
        def lv_id = it.text().replaceAll("&","%26");
        if (init == true) {
            filter.append("userId eq '" + lv_id + "'");
            //filter.append("'" + lv_id + "'");
            init = false;
        }
        else {
            //filter.append(",'" + lv_id + "'");
            filter.append(" or userId eq '" + lv_id + "'");
        }
    }

        
     message.setProperty('filterUserId', filter.toString());

  //  if('true'.equalsIgnoreCase(properties.get('EnablePayloadLogging'))){
 //       def messageLog = messageLogFactory.getMessageLog(message);
  //      messageLog.addAttachmentAsString("filterUserId", filter.toString(), "text/plain");
  //  }

    return message;
    
}
