import com.sap.gateway.ip.core.customdev.util.Message;
import java.nio.charset.StandardCharsets;

def Message processData(Message message) 
{
  def payload  = message.getBody(java.lang.String) as String;

  byte[] bom   = [0xEF,0xBB,0xBF];  
  byte[] doc   = payload.getBytes(StandardCharsets.UTF_8);

  message.setBody(new String(bom,'UTF-8') + new String(doc,'UTF-8'));

  return message;
}