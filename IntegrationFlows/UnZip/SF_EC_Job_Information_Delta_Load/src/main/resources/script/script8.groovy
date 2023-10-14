import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;
import groovy.xml.*;
import java.util.regex.*;
import java.io.*;


def Message getHomeEmployment(Message message) {
	
	def body = message.getBody(java.io.Reader);
	HashMap<String, String> hmap1 = new HashMap<String, String>();	
	HashMap<String, String> hmap2 = new HashMap<String, String>();
	HashMap<String, String> hmap3 = new HashMap<String, String>();
	map = message.getProperties();
	def Root = new XmlSlurper().parse(body);

    Root.EmpEmployment.each{
        try{
         hmap1.put(it.personIdExternal.text().toString(),it.startDate.text().toString());
         hmap2.put(it.personIdExternal.text().toString(),it.endDate.text().toString());
        }
        catch(Exception ex){
            //do nothing, skip the record
        }
    }
	message.setProperty("GAStartDateHashMap", hmap1);
	message.setProperty("GAEndDateHashMap", hmap2);
	return message;
}