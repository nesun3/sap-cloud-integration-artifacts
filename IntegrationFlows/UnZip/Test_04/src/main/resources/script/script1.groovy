import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;
def Message processData(Message message) {
    
    def body = message.getBody(String);
    message.setProperty("property1", "UPADTED");
    return message;
    
}