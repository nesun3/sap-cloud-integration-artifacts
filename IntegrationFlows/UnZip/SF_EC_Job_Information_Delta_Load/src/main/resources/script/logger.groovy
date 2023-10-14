import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Callable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import groovy.transform.Field;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Map;

import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import org.w3c.dom.Node;




import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;

import org.w3c.dom.Node;
import java.util.concurrent.atomic.AtomicInteger;



@Field String LOG_ID = '{CONTEXT.NAME}'

@Field String MPL_LOGGING_MODE           = 'ALWAYS';   //ALWAYS, NEVER, PROPERTY
@Field String FILE_LOGGING_MODE          = 'NEVER';  //ALWAYS, NEVER , PROPERTY

@Field List EXCLUDE_PROPERTIES    = ['SAP_MessageProcessingLogID', 'SAP_MonitoringStateProperties', 'MplMarkers', 'SAP_MessageProcessingLog', 'Authorization'];
@Field List EXCLUDE_HEADERS       = ['Authorization'];

@Field String LOG_HEADERS           = 'YES';   //YES / NO
@Field String LOG_PROPERTIES        = 'YES';   //YES / NO
@Field String LOG_BODY_INFO         = 'YES';   //YES / NO
@Field String LOG_EXCEPTION         = 'YES';   //YES / NO
@Field String LOG_OTHER             = 'YES';   //YES / NO
@Field String LOG_BODY              = 'YES';   //YES / NO / PROPERTY
@Field String LOG_ATTACHMENTS_INFO  = 'YES';   //YES / NO
@Field String LOG_ATTACHMENTS_BODY  = 'YES';   //YES / NO
@Field String LOG_SOAP_HEADERS_INFO = 'YES';   //YES / NO
@Field String MODIFY_EXCHANGE       = 'YES';   //YES / NO

@Field String PROPERTY_INVOCATION_COUNTER          = 'SAP_METVIEWER_INVOCATION_COUNTER'
@Field String PROPERTY_LAST_TIMESTAMP              = 'SAP_METVIEWER_LAST_TIMESTAMP'
@Field String PROPERTY_ENABLE_MPL_LOGGING          = 'ENABLE_LOGGING'
@Field String PROPERTY_ENABLE_FILE_LOGGING         = 'ENABLE_FILE_LOGGING'
@Field String PROPERTY_ENABLE_PAYLOAD_LOGGING      = 'ENABLE_PAYLOAD_LOGGING'

@Field Logger log = LoggerFactory.getLogger("com.sap.hci.metviewer.logger");

@Field ThreadLocal<Integer> threadLocalCounter = new ThreadLocal<>();

@Field AtomicInteger globalCounter= new AtomicInteger(0);

@Field List LEVEL_NONE = [];
@Field List LEVEL_ERROR = ["ERROR","WARN", "INFO","DEBUG"];
@Field List LEVEL_WARN = ["WARN", "INFO","DEBUG"];
@Field List LEVEL_DEBUG = ["DEBUG", "INFO"];
@Field List LEVEL_INFO = ["INFO"];
    
// if you use this method, you need to copy the script for every usage and adapt the filename (000)
def Message processData(Message message) {
//    Logger log = LoggerFactory.getLogger(this.getClass());
    
    return info(message);
    
}

def Message infoTrace(Message message, name) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (!LEVEL_INFO.contains(loggingLevel)){
        return message;
    }
    return logTrace(message, name);

}

def Message info_0000(Message message) {
    return infoTrace(message, 'info_0000');
}

def Message info_0001(Message message) {
    return infoTrace(message, 'info_0001');
}

def Message info_0002(Message message) {
    return infoTrace(message, 'info_0002');
}

def Message info_0003(Message message) {
    return infoTrace(message, 'info_0003');
}

def Message info_0004(Message message) {
    return infoTrace(message, 'info_0004');
}

def Message info_0005(Message message) {
    return infoTrace(message, 'info_0005');
}

def Message info_0006(Message message) {
    return infoTrace(message, 'info_0006');
}

def Message info_0007(Message message) {
    return infoTrace(message, 'info_0007');
}

def Message info_0008(Message message) {
    return infoTrace(message, 'info_0008');
}

def Message info_0009(Message message) {
    return infoTrace(message, 'info_0009');
}

def Message info_0010(Message message) {
    return infoTrace(message, 'info_0010');
}

def Message info_0011(Message message) {
    return infoTrace(message, 'info_0011');
}

def Message info_0012(Message message) {
    return infoTrace(message, 'info_0012');
}

def Message info_0013(Message message) {
    return infoTrace(message, 'info_0013');
}

def Message info_0014(Message message) {
    return infoTrace(message, 'info_0014');
}

def Message info_0015(Message message) {
    return infoTrace(message, 'info_0015');
}

def Message info_0016(Message message) {
    return infoTrace(message, 'info_0016');
}

def Message info_0017(Message message) {
    return infoTrace(message, 'info_0017');
}

def Message info_0018(Message message) {
    return infoTrace(message, 'info_0018');
}

def Message info_0019(Message message) {
    return infoTrace(message, 'info_0019');
}

def Message info_0020(Message message) {
    return infoTrace(message, 'info_0020');
}

def Message info_0021(Message message) {
    return infoTrace(message, 'info_0021');
}

def Message info_0022(Message message) {
    return infoTrace(message, 'info_0022');
}

def Message info_0023(Message message) {
    return infoTrace(message, 'info_0023');
}

def Message info_0024(Message message) {
    return infoTrace(message, 'info_0024');
}

def Message info_0025(Message message) {
    return infoTrace(message, 'info_0025');
}

def Message info_0026(Message message) {
    return infoTrace(message, 'info_0026');
}

def Message info_0027(Message message) {
    return infoTrace(message, 'info_0027');
}

def Message info_0028(Message message) {
    return infoTrace(message, 'info_0028');
}

def Message info_0029(Message message) {
    return infoTrace(message, 'info_0029');
}

def Message info_0030(Message message) {
    return infoTrace(message, 'info_0030');
}

def Message info_00_00(Message message) {
    return infoTrace(message, 'info_00_00');
}

def Message info_00_01(Message message) {
    return infoTrace(message, 'info_00_01');
}

def Message info_00_02(Message message) {
    return infoTrace(message, 'info_00_02');
}

def Message info_00_03(Message message) {
    return infoTrace(message, 'info_00_03');
}

def Message info_00_04(Message message) {
    return infoTrace(message, 'info_00_04');
}

def Message info_00_05(Message message) {
    return infoTrace(message, 'info_00_05');
}

def Message info_00_06(Message message) {
    return infoTrace(message, 'info_00_06');
}

def Message info_00_07(Message message) {
    return infoTrace(message, 'info_00_07');
}

def Message info_00_08(Message message) {
    return infoTrace(message, 'info_00_08');
}

def Message info_00_09(Message message) {
    return infoTrace(message, 'info_00_09');
}

def Message info_00_10(Message message) {
    return infoTrace(message, 'info_00_10');
}

def Message info_00_11(Message message) {
    return infoTrace(message, 'info_00_11');
}

def Message info_00_12(Message message) {
    return infoTrace(message, 'info_00_12');
}

def Message info_00_13(Message message) {
    return infoTrace(message, 'info_00_13');
}

def Message info_00_14(Message message) {
    return infoTrace(message, 'info_00_14');
}

def Message info_00_15(Message message) {
    return infoTrace(message, 'info_00_15');
}

def Message info_00_16(Message message) {
    return infoTrace(message, 'info_00_16');
}

def Message info_00_17(Message message) {
    return infoTrace(message, 'info_00_17');
}

def Message info_00_18(Message message) {
    return infoTrace(message, 'info_00_18');
}

def Message info_00_19(Message message) {
    return infoTrace(message, 'info_00_19');
}

def Message info_00_20(Message message) {
    return infoTrace(message, 'info_00_20');
}

def Message info_00_21(Message message) {
    return infoTrace(message, 'info_00_21');
}

def Message info_00_22(Message message) {
    return infoTrace(message, 'info_00_22');
}

def Message info_00_23(Message message) {
    return infoTrace(message, 'info_00_23');
}

def Message info_00_24(Message message) {
    return infoTrace(message, 'info_00_24');
}

def Message info_00_25(Message message) {
    return infoTrace(message, 'info_00_25');
}

def Message info_00_26(Message message) {
    return infoTrace(message, 'info_00_26');
}

def Message info_00_27(Message message) {
    return infoTrace(message, 'info_00_27');
}

def Message info_00_28(Message message) {
    return infoTrace(message, 'info_00_28');
}

def Message info_00_29(Message message) {
    return infoTrace(message, 'info_00_29');
}

def Message info_A_00(Message message) {
    return infoTrace(message, 'info_A_00');
}

def Message info_A_01(Message message) {
    return infoTrace(message, 'info_A_01');
}

def Message info_A_02(Message message) {
    return infoTrace(message, 'info_A_02');
}

def Message info_A_03(Message message) {
    return infoTrace(message, 'info_A_03');
}

def Message info_A_04(Message message) {
    return infoTrace(message, 'info_A_04');
}

def Message info_A_05(Message message) {
    return infoTrace(message, 'info_A_05');
}

def Message info_A_06(Message message) {
    return infoTrace(message, 'info_A_06');
}

def Message info_A_07(Message message) {
    return infoTrace(message, 'info_A_07');
}

def Message info_A_08(Message message) {
    return infoTrace(message, 'info_A_08');
}

def Message info_A_09(Message message) {
    return infoTrace(message, 'info_A_09');
}

def Message info_A_10(Message message) {
    return infoTrace(message, 'info_A_10');
}

def Message info_A_11(Message message) {
    return infoTrace(message, 'info_A_11');
}

def Message info_A_12(Message message) {
    return infoTrace(message, 'info_A_12');
}

def Message info_A_13(Message message) {
    return infoTrace(message, 'info_A_13');
}

def Message info_A_14(Message message) {
    return infoTrace(message, 'info_A_14');
}

def Message info_A_15(Message message) {
    return infoTrace(message, 'info_A_15');
}

def Message info_A_16(Message message) {
    return infoTrace(message, 'info_A_16');
}

def Message info_A_17(Message message) {
    return infoTrace(message, 'info_A_17');
}

def Message info_A_18(Message message) {
    return infoTrace(message, 'info_A_18');
}

def Message info_A_19(Message message) {
    return infoTrace(message, 'info_A_19');
}

def Message info_B_00(Message message) {
    return infoTrace(message, 'info_B_00');
}

def Message info_B_01(Message message) {
    return infoTrace(message, 'info_B_01');
}

def Message info_B_02(Message message) {
    return infoTrace(message, 'info_B_02');
}

def Message info_B_03(Message message) {
    return infoTrace(message, 'info_B_03');
}

def Message info_B_04(Message message) {
    return infoTrace(message, 'info_B_04');
}

def Message info_B_05(Message message) {
    return infoTrace(message, 'info_B_05');
}

def Message info_B_06(Message message) {
    return infoTrace(message, 'info_B_06');
}

def Message info_B_07(Message message) {
    return infoTrace(message, 'info_B_07');
}

def Message info_B_08(Message message) {
    return infoTrace(message, 'info_B_08');
}

def Message info_B_09(Message message) {
    return infoTrace(message, 'info_B_09');
}

def Message info_B_10(Message message) {
    return infoTrace(message, 'info_B_10');
}

def Message info_B_11(Message message) {
    return infoTrace(message, 'info_B_11');
}

def Message info_B_12(Message message) {
    return infoTrace(message, 'info_B_12');
}

def Message info_B_13(Message message) {
    return infoTrace(message, 'info_B_13');
}

def Message info_B_14(Message message) {
    return infoTrace(message, 'info_B_14');
}

def Message info_B_15(Message message) {
    return infoTrace(message, 'info_B_15');
}

def Message info_B_16(Message message) {
    return infoTrace(message, 'info_B_16');
}

def Message info_B_17(Message message) {
    return infoTrace(message, 'info_B_17');
}

def Message info_B_18(Message message) {
    return infoTrace(message, 'info_B_18');
}

def Message info_B_19(Message message) {
    return infoTrace(message, 'info_B_19');
}

def Message info_C_00(Message message) {
    return infoTrace(message, 'info_C_00');
}

def Message info_C_01(Message message) {
    return infoTrace(message, 'info_C_01');
}

def Message info_C_02(Message message) {
    return infoTrace(message, 'info_C_02');
}

def Message info_C_03(Message message) {
    return infoTrace(message, 'info_C_03');
}

def Message info_C_04(Message message) {
    return infoTrace(message, 'info_C_04');
}

def Message info_C_05(Message message) {
    return infoTrace(message, 'info_C_05');
}

def Message info_C_06(Message message) {
    return infoTrace(message, 'info_C_06');
}

def Message info_C_07(Message message) {
    return infoTrace(message, 'info_C_07');
}

def Message info_C_08(Message message) {
    return infoTrace(message, 'info_C_08');
}

def Message info_C_09(Message message) {
    return infoTrace(message, 'info_C_09');
}

def Message info_C_10(Message message) {
    return infoTrace(message, 'info_C_10');
}

def Message info_C_11(Message message) {
    return infoTrace(message, 'info_C_11');
}

def Message info_C_12(Message message) {
    return infoTrace(message, 'info_C_12');
}

def Message info_C_13(Message message) {
    return infoTrace(message, 'info_C_13');
}

def Message info_C_14(Message message) {
    return infoTrace(message, 'info_C_14');
}

def Message info_C_15(Message message) {
    return infoTrace(message, 'info_C_15');
}

def Message info_C_16(Message message) {
    return infoTrace(message, 'info_C_16');
}

def Message info_C_17(Message message) {
    return infoTrace(message, 'info_C_17');
}

def Message info_C_18(Message message) {
    return infoTrace(message, 'info_C_18');
}

def Message info_C_19(Message message) {
    return infoTrace(message, 'info_C_19');
}

def Message info_D_00(Message message) {
    return infoTrace(message, 'info_D_00');
}

def Message info_D_01(Message message) {
    return infoTrace(message, 'info_D_01');
}

def Message info_D_02(Message message) {
    return infoTrace(message, 'info_D_02');
}

def Message info_D_03(Message message) {
    return infoTrace(message, 'info_D_03');
}

def Message info_D_04(Message message) {
    return infoTrace(message, 'info_D_04');
}

def Message info_D_05(Message message) {
    return infoTrace(message, 'info_D_05');
}

def Message info_D_06(Message message) {
    return infoTrace(message, 'info_D_06');
}

def Message info_D_07(Message message) {
    return infoTrace(message, 'info_D_07');
}

def Message info_D_08(Message message) {
    return infoTrace(message, 'info_D_08');
}

def Message info_D_09(Message message) {
    return infoTrace(message, 'info_D_09');
}

def Message info_D_10(Message message) {
    return infoTrace(message, 'info_D_10');
}

def Message info_D_11(Message message) {
    return infoTrace(message, 'info_D_11');
}

def Message info_D_12(Message message) {
    return infoTrace(message, 'info_D_12');
}

def Message info_D_13(Message message) {
    return infoTrace(message, 'info_D_13');
}

def Message info_D_14(Message message) {
    return infoTrace(message, 'info_D_14');
}

def Message info_D_15(Message message) {
    return infoTrace(message, 'info_D_15');
}

def Message info_D_16(Message message) {
    return infoTrace(message, 'info_D_16');
}

def Message info_D_17(Message message) {
    return infoTrace(message, 'info_D_17');
}

def Message info_D_18(Message message) {
    return infoTrace(message, 'info_D_18');
}

def Message info_D_19(Message message) {
    return infoTrace(message, 'info_D_19');
}

def Message logTrace(Message message, String desc){
    
    def tid = Thread.currentThread().getId();
    def localCounter = threadLocalCounter.get();
    if(localCounter == null) localCounter = 0;
    threadLocalCounter.set(++localCounter);
    
    def modifier = message.getProperty("modifier");
    if(!modifier){ modifier = 10000;}
    def glbal_counter = globalCounter.incrementAndGet();
    def prefix = String.format("%05d_%05d", tid, glbal_counter);
    try {
        increaseInternalProperties(message);
        processHeadersAndProperties(    "${prefix}_${desc}_info",   message);
        processBody(                    "${prefix}_${desc}_payload",   message);
        processAttachmentBody(          "${prefix}_${desc}_attachment_",   message);
        
    } catch (Exception ex) {
        log.error("processData error",ex);
    }
    return message;
}

def Message info(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (!LEVEL_INFO.contains(loggingLevel)){
        return message;
    }
    return logTrace(message, 'information');

}

def Message debug(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (!LEVEL_DEBUG.contains(loggingLevel)){
        return message;
    }
    return logTrace(message, 'debug');

}
def Message warn(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (!LEVEL_WARN.contains(loggingLevel)){
        return message;
    }
    return logTrace(message, 'warn');

}

def Message error(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (!LEVEL_ERROR.contains(loggingLevel)){
        return message;
    }
    return logTrace(message, 'error');

}


def Message logDuringLocalCall(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (loggingLevel == "NONE"){
        return message;
    }
    return logTrace(message, 'logDuringLocalCall');

}

def Message logAfterLocalCall(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (loggingLevel == "NONE"){
        return message;
    }
return logTrace(message, 'logAfterLocalCall');
}

def Message logBeforeUpsertCall(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (loggingLevel == "NONE"){
        return message;
    }
return logTrace(message, 'logBeforeUpsertCall');
}

def Message logFailedAfterLocalCall(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (loggingLevel == "NONE"){
        return message;
    }
return logTrace(message, 'logFailedAfterLocalCall');
}

def Message logAfterMerge(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (loggingLevel == "NONE"){
        return message;
    }
return logTrace(message, 'logAfterMerge');
}

def Message logMergedFailedCases(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (loggingLevel == "NONE"){
        return message;
    }
return logTrace(message, 'logMergedFailedCases');
}

def Message logMergedSucceededCases(Message message) {
    def loggingLevel = message.getProperty("loggingLevel");
    if (loggingLevel == "NONE"){
        return message;
    }
return logTrace(message, 'logMergedSucceededCases');
}







def boolean isTrue(String str) {
    if ('ALWAYS'.equalsIgnoreCase(str)) {
        return true;
    } else if ('TRUE'.equalsIgnoreCase(str)) {
       return true;
    } else if ('YES'.equalsIgnoreCase(str)) {
       return true;
    } else if ('ON'.equalsIgnoreCase(str)) {
       return true;
    }
    return false;
}




def void increaseInternalProperties(Message message) {

   def props = message.getProperties();
   def Object counter = props.get(PROPERTY_INVOCATION_COUNTER);
   
   if (counter==null) {
        counter = new StringBuffer();
        counter.append("0");
    } else if (counter instanceof String) {
        String value_str = counter;
        counter = new StringBuffer();
        counter.append(value_str);
    }

    if (isTrue(MODIFY_EXCHANGE)) {
       message.setProperty(PROPERTY_INVOCATION_COUNTER, counter);
    }
            
    int cnt = Integer.valueOf(counter.toString());
    cnt = cnt+1;
    def counterS = String.format( "%04d", cnt );
    counter.setLength(0);
    counter.append(counterS);
    
}


def void processLoggerLine(String prefix_with_vars, Message message) {
  def byte[] body_bytes = null;
  try {

    def prefix = resolveVariables(prefix_with_vars, message);
    log.error(prefix);

  } catch (Exception ex01) {
    log.error("cannot write logger line",ex01);
    StringWriter sw = new StringWriter();
    ex01.printStackTrace(new PrintWriter(sw));
    log.info(sw.toString());
  }
}

def Message processData(String prefix, Message message) {
    try {
        processBody(prefix+"_payload", message);
        processHeadersAndProperties(prefix, message);
    } catch (Exception ex00) {
        log.error("processData error",ex00)
        StringWriter sw = new StringWriter();
        ex00.printStackTrace(new PrintWriter(sw));
        log.error(sw.toString());
    }
    return message;
}


def Map excludeEntries(Map map, List excluded) {
    def newMap = new HashMap();
    newMap.putAll(map);
    newMap.keySet().removeAll(excluded);
    return newMap;
    
}



def void processBody(String prefix_with_vars, Message message) {
    def byte[] body_bytes = null;
    try {
        
        def prefix = resolveVariables(prefix_with_vars, message);
        
        def enable = false;

        
        def props = message.getProperties();
        def property_ENABLE_MPL_LOGGING = props.get(PROPERTY_ENABLE_MPL_LOGGING);
        def property_ENABLE_FILE_LOGGING = props.get(PROPERTY_ENABLE_FILE_LOGGING);
        def property_ENABLE_PAYLOAD_LOGGING = props.get(PROPERTY_ENABLE_PAYLOAD_LOGGING);
        
        
        
        if ('YES'.equalsIgnoreCase(LOG_BODY)) {
            enable = true;
        } else if ('PROPERTY'.equalsIgnoreCase(LOG_BODY)) {
          if (isTrue(property_ENABLE_PAYLOAD_LOGGING)) {
              enable = true;
          }
        }
            
        if (!enable) return;
        
        if (message==null) {
            body_bytes = new byte[0];
        } else if (message.getBody() == null) {
            body_bytes = new byte[0];
        } else {
            body_bytes = message.getBody(byte[].class);
        }
        
        def mpl_enabled = false;
        if (isTrue(MPL_LOGGING_MODE)) {
            mpl_enabled = true;
        } else if ("PROPERTY".equalsIgnoreCase(MPL_LOGGING_MODE)) {
            if (isTrue(property_ENABLE_MPL_LOGGING)) {
                mpl_enabled = true;
            }
        }
        
        
        def file_enabled = false;
        if (isTrue(FILE_LOGGING_MODE)) {
            file_enabled = true;
        } else if ("PROPERTY".equalsIgnoreCase(FILE_LOGGING_MODE)) {
            if (isTrue(property_ENABLE_FILE_LOGGING)) {
                file_enabled = true;
            }
        }
        
        if (mpl_enabled) {
            def messageLog = messageLogFactory.getMessageLog(message);
            def mpl_prefix = prefix;
            if (prefix.startsWith(message.exchange.getContext().getName()+'_')) {
               mpl_prefix = prefix.substring(message.exchange.getContext().getName().length()+1);
            }
            messageLog.addAttachmentAsString(mpl_prefix, new String(body_bytes), "text/plain");
        }
        
        if (file_enabled) {
            ExecutorService pool = Executors.newSingleThreadExecutor();
            def task = {c -> pool.submit( c as Callable)}
            task{ saveFile(""+prefix+".xml", body_bytes) }
        }
        
    } catch (Exception ex01) {
        log.error("cannot save body",ex01);
        StringWriter sw = new StringWriter();
        ex01.printStackTrace(new PrintWriter(sw));
        log.info(sw.toString());
    }
}



def void processAttachmentBody(String prefix_with_vars, Message message) {
    def byte[] body_bytes = null;
    try {
        
        def prefix = resolveVariables(prefix_with_vars, message);
        
        def enable = false;
    
        if (isTrue(LOG_ATTACHMENTS_BODY)) {
            enable = true;
        }
            
        if (!enable) return;
        
        def props = message.getProperties();
        def property_ENABLE_MPL_LOGGING = props.get(PROPERTY_ENABLE_MPL_LOGGING);
        def property_ENABLE_FILE_LOGGING = props.get(PROPERTY_ENABLE_FILE_LOGGING);
        
        def mpl_enabled = false;
        if (isTrue(MPL_LOGGING_MODE)) {
            mpl_enabled = true;
        } else if ("PROPERTY".equalsIgnoreCase(MPL_LOGGING_MODE)) {
            if (isTrue(property_ENABLE_MPL_LOGGING)) {
                mpl_enabled = true;
            }
        }
        
        
        def file_enabled = false;
        if (isTrue(FILE_LOGGING_MODE)) {
            file_enabled = true;
        } else if ("PROPERTY".equalsIgnoreCase(FILE_LOGGING_MODE)) {
            if (isTrue(property_ENABLE_FILE_LOGGING)) {
                file_enabled = true;
            }
        }
        
        
        def attachments = message.getAttachments();
        if ((attachments!=null)&&(!attachments.isEmpty())) {
             def base_mpl_prefix = prefix;
             if (prefix.startsWith(message.exchange.getContext().getName())) {
                base_mpl_prefix = prefix.substring(message.exchange.getContext().getName().length()+1);
             }
             
             
             attachments.each { key ->
               def attachment_body = readInputStream(attachments.get(key.getKey()).getInputStream());
               if (mpl_enabled) {
                 def mpl_prefix = base_mpl_prefix + key.getKey();
                 def messageLog = messageLogFactory.getMessageLog(message);
                 messageLog.addAttachmentAsString(mpl_prefix, new String(attachment_body, "UTF-8"), "text/plain");
               }
        
           if (file_enabled) {
             ExecutorService pool = Executors.newSingleThreadExecutor();
             def task = {c -> pool.submit( c as Callable)}
             task{saveFile(""+prefix+key.getKey()+".bin", attachment_body)}
           }
            }
          }
          
    } catch (Exception ex01) {
        log.error("cannot save attachment body",ex01);
        StringWriter sw = new StringWriter();
        ex01.printStackTrace(new PrintWriter(sw));
        log.info(sw.toString());
    }
}

def String resolveVariables(String str, Message message) {

    def counter = message.getProperties().get(PROPERTY_INVOCATION_COUNTER);
    if (counter == null) {
       counter = '0';
    }
    
  def result = str.replaceAll(~/\{COUNTER\}/, counter);
  
  result = result.replaceAll(~/\{LOG_ID\}/, LOG_ID);
  
  result = result.replaceAll(~/\{CONTEXT.NAME\}/, message.exchange.getContext().getName());
  
  
  return result;

}



  boolean skipNL;
  String printXML(org.w3c.dom.Node rootNode) {
    String tab = "";
    skipNL = false;
    return(printXML(rootNode, tab));
}
  String printXML(org.w3c.dom.Node rootNode, String tab) {
    String print = "";
    if(rootNode.getNodeType()==org.w3c.dom.Node.ELEMENT_NODE) {
        print += "\n"+tab+"<"+rootNode.getNodeName()+">";
    }
    org.w3c.dom.NodeList nl = rootNode.getChildNodes();
    if(nl.getLength()>0) {
        for (int i = 0; i < nl.getLength(); i++) {
            print += printXML(nl.item(i), tab+"  ");    // \t
        }
    } else {
        if(rootNode.getNodeValue()!=null) {
            print = rootNode.getNodeValue();
        }
        skipNL = true;
    }
    if(rootNode.getNodeType()==org.w3c.dom.Node.ELEMENT_NODE) {
        if(!skipNL) {
            print += "\n"+tab;
        }
        skipNL = false;
        print += "</"+rootNode.getNodeName()+">";
    }
    return(print);
}


def void processHeadersAndProperties(String prefix_with_vars, Message message) {
    try {
    
    log.debug("processHeadersAndProperties: " +prefix_with_vars +" START");

      log.debug("processHeadersAndProperties: " +prefix_with_vars +" MAIN01");
        
        def prefix = resolveVariables(prefix_with_vars, message);
        
        def StringBuffer sb_html = new StringBuffer();
        def StringBuffer sb_text = new StringBuffer();
    
        def map = message.getHeaders();
        
        def enable = false;
        if ('YES'.equalsIgnoreCase(LOG_HEADERS)) {
            enable = true;
        }
        
        if (enable) {
            map = excludeEntries(map, EXCLUDE_HEADERS);
            dumpProperties_TEXT_escaped("Headers", map, sb_html);
            dumpProperties_TEXT("Headers", map, sb_text);
        }
        
        
        map = message.getProperties();
        
        
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  PROPERTIES01");
        
        enable = false;
        if ('YES'.equalsIgnoreCase(LOG_PROPERTIES)) {
            enable = true;
        }

        if (enable) {
            map = excludeEntries(map, EXCLUDE_PROPERTIES);
            dumpProperties_TEXT_escaped("Properties", map, sb_html);
            dumpProperties_TEXT("Properties", map, sb_text);
        }
        
        
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  EXCEPTION01");
        
        enable = false;
        if ('YES'.equalsIgnoreCase(LOG_EXCEPTION)) {
            enable = true;
        }
        
        if (enable) {
            
        def ex = map.get("CamelExceptionCaught");
        if (ex!=null) {
            
            def exmap = new HashMap();
            exmap.put("exception",ex);
            exmap.put("getCanonicalName",ex.getClass().getCanonicalName());
            exmap.put("getMessage",ex.getMessage());
            
            StringWriter swe = new StringWriter();
            ex.printStackTrace(new PrintWriter(swe));
            exmap.put("stacktrace",swe.toString());
            
            if (ex.getClass().getCanonicalName().equals("org.apache.camel.component.ahc.AhcOperationFailedException")) {
                exmap.put("responseBody",safeEscapeXml(ex.getResponseBody()));
                exmap.put("responseBody.className",safeClassName(ex));
                exmap.put("getStatusText",ex.getStatusText());
                exmap.put("getStatusCode",ex.getStatusCode());
            }
            
            if (ex instanceof org.apache.cxf.interceptor.Fault) {
                exmap.put("getDetail",safeEscapeXml(ex.getDetail()));
                exmap.put("getDetail.className",safeClassName(ex.getDetail()));
                exmap.put("getFaultCode",ex.getFaultCode());
                exmap.put("getMessage",ex.getMessage());
                exmap.put("getStatusCode",""+ex.getStatusCode());
                exmap.put("hasDetails",""+ex.hasDetails());
                
                //message.getHeaders().put("SoapFaultMessage", ex.getMessage());
                exmap.put("getCause",""+ex.getCause());

        if (ex.getCause()!=null) {
          def cause_message = ex.getCause().getMessage();
          if (ex.getCause() instanceof org.apache.cxf.transport.http.HTTPException) {
            cause_message = ex.getCause().getResponseMessage();
          }
          exmap.put("getCause.getResponseMessage",""+cause_message);
          message.getHeaders().put("SoapFaultMessage", ex.getMessage() +": "+ ex.getCause().getResponseMessage());
        }
                
            }
            
            
            dumpProperties_TEXT_escaped("property.CamelExceptionCaught", exmap, sb_html);
            dumpProperties_TEXT("property.CamelExceptionCaught", exmap, sb_text);
        }
            
        }


//org.apache.cxf.headers.Header.list


    log.debug("processHeadersAndProperties: " +prefix_with_vars +"  SOAP_HEADERS_INFO01");
        
        enable = false;
        if ('YES'.equalsIgnoreCase(LOG_SOAP_HEADERS_INFO)) {
            enable = true;
        }
        
        if (enable) {

            def infomap = new HashMap();
            
            def headers = message.getHeaders();
            def list = headers.get("org.apache.cxf.headers.Header.list");
            if (list!=null) {
            
              infomap.put("\${header.org.apache.cxf.headers.Header.list}", list);
            
              infomap.put("size", list.size());
              list.each { header ->
              
          //   elements of this head: com.sun.org.apache.xerces.internal.dom.ElementNSImpl
          
          //infomap.put("header["+header.getName()+"].object.clazz", header.getObject().getClass());
          infomap.put("header["+header.getName()+"]", header);
         
          org.w3c.dom.Node element = (Node) header.getObject();
          def document = element.getOwnerDocument();
          //conversion using Transformer class |
          def str1 = printXML(element);
                infomap.put("header["+header.getName()+"].value", safeEscapeXml(str1));
              }
            }
            
            
          dumpProperties_TEXT_escaped("SOAP Headers", infomap, sb_html);
            dumpProperties_TEXT("SOAP Headers", infomap, sb_text);
                          
           
            
      }
                   

    log.debug("processHeadersAndProperties: " +prefix_with_vars +"  ATTACHMENT_INFO01");
        
        enable = false;
        if ('YES'.equalsIgnoreCase(LOG_ATTACHMENTS_INFO)) {
            enable = true;
        }
        
        if (enable) {

            def infomap = new HashMap();
            
          def attachments = message.getAttachments();
            if ((attachments!=null)&&(!attachments.isEmpty())) {
              infomap.put("attachments",attachments);
              infomap.put("attachments.clazz.name",attachments.getClass().getName());
              infomap.put("attachments.keys",attachments.getOriginalMap().keySet());
              
              attachments.each { key -> infomap.put("attachments["+key.getKey()+"]", attachments.get(key.getKey()))  }
              
//              if ('YES'.equalsIgnoreCase(LOG_ATTACHMENTS_BODY)) {
//                 attachments.each { key -> infomap.put("attachments.stream["+key.getKey()+"]", new String(readInputStream(attachments.get(key.getKey()).getInputStream())))  }
//              }
              
              dumpProperties_TEXT_escaped("Attachments", infomap, sb_html);
              dumpProperties_TEXT("Attachments", infomap, sb_text);
                          
            }
            
      }
        
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_INFO01");
        
        enable = false;
        if ('YES'.equalsIgnoreCase(LOG_BODY_INFO)) {
            enable = true;
        }
        
        if (enable) {

            def body_test = message.getBody();
            def bodymap = new HashMap();
            
            if (body_test instanceof String) {
              if (body_test.length()>80) {
                 body_test = body_test.substring(0,80)+"...";
              }
            }
            
            bodymap.put("Body",body_test);
            
            if (body_test!=null) {
                bodymap.put("body.clazz.name",body_test.getClass().getCanonicalName());
            }
            
            dumpProperties_TEXT_escaped("Body", bodymap, sb_html);
            dumpProperties_TEXT("Body", bodymap, sb_text);
            

        }
        
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_OTHER01");
        
        enable = false;
        if ('YES'.equalsIgnoreCase(LOG_OTHER)) {
            enable = true;
        }
        
        if (enable) {
       
            def othermap = new HashMap();
            
            def currentDate = new Date();
            def timestamp = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(currentDate);
            othermap.put("CurrentTimestamp",timestamp);

        
            def lasttimestamp = message.getProperties().get(PROPERTY_LAST_TIMESTAMP);
            
        
            if (lasttimestamp!=null) {
                def last_timestamp_str = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(lasttimestamp);
                othermap.put("LastTimestamp",last_timestamp_str);
                  long diff = currentDate.getTime() - lasttimestamp.getTime();
                  def diff_str = new java.text.SimpleDateFormat("HH:mm:ss.SSS").format(diff);
                  othermap.put("CurrentTimestamp-LastTimestamp",diff_str);
            }
            
            
            if (isTrue(MODIFY_EXCHANGE)) {
               message.setProperty(PROPERTY_LAST_TIMESTAMP, currentDate);
            }
            
            
            othermap.put("Exchange",message.exchange);
            othermap.put("Exchange.exchangeId",message.exchange.getExchangeId());
            
      othermap.put("CamelContext",message.exchange.getContext());
      othermap.put("CamelContext.name",message.exchange.getContext().getName());
      
            //meta-inf/manifest.mf
            //OSGI-INF/blueprint/beans.xml
            //resources/parameters.prop
            
           //def bytes = this.getClass().getResource("/meta-inf/manifest.mf");
        //def bytes = readInputStream(message.getClass().getClassLoader().getResource("META-INF/MANIFEST.MF").openConnection().getInputStream());
            //def bytes = readInputStream(message.getClass().getClassLoader().getResource("META-INF/MANIFEST.MF").openConnection().getInputStream());
            //def bytes = readInputStream(message.getClass().getResourceAsStream("./meta-inf/manifest.mf"));
           // def bytes = readInputStream(Thread.currentThread().getContextClassLoader().getResourceAsStream("META-INF/MANIFEST.MF"));
            //String bytes = new File("./src/main/resources/mapping/addLogItemsToConcurPayload.xsl").getText();
           //String bytes = new File("./META-INF/MANIFEST.MF").getText();
           //String file = new File(".");
           //StringBuffer sb = new StringBuffer();
           //sb.append("file.getName()");
          // def bytes = sb.toString().getBytes();
//           def fileContent = new String(bytes,"UTF-8");
//           othermap.put("bytes",fileContent);
           

            dumpProperties_TEXT_escaped("Other", othermap, sb_html);
            dumpProperties_TEXT("Other", othermap, sb_text);
                        
        }
        
        
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_CONFIG01");
        
        
        def props = message.getProperties();
        def property_ENABLE_MPL_LOGGING = props.get(PROPERTY_ENABLE_MPL_LOGGING);
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_CONFIG02:property_ENABLE_MPL_LOGGING="+ property_ENABLE_MPL_LOGGING);
        
        
        def property_ENABLE_FILE_LOGGING = props.get(PROPERTY_ENABLE_FILE_LOGGING);
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_CONFIG03:property_ENABLE_FILE_LOGGING="+ property_ENABLE_FILE_LOGGING);
        
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_CONFIG04:MPL_LOGGING_MODE="+ MPL_LOGGING_MODE);
        
        def mpl_enabled = false;
        if (isTrue(MPL_LOGGING_MODE)) {
            log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_CONFIG04a:mpl_enabled="+ mpl_enabled);
            mpl_enabled = true;
        } else if ("PROPERTY".equalsIgnoreCase(MPL_LOGGING_MODE)) {
            log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_CONFIG04b:MPL_LOGGING_MODE="+ MPL_LOGGING_MODE);
            if (isTrue(property_ENABLE_MPL_LOGGING)) {
                mpl_enabled = true;
                log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_CONFIG04c:mpl_enabled="+ mpl_enabled);
            }
        }
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_CONFIG05:mpl_enabled="+ mpl_enabled);
        
        
        def file_enabled = false;
        if (isTrue(FILE_LOGGING_MODE)) {
            file_enabled = true;
        } else if ("PROPERTY".equalsIgnoreCase(FILE_LOGGING_MODE)) {
            if (isTrue(property_ENABLE_FILE_LOGGING)) {
                file_enabled = true;
            }
        }
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  BODY_CONFIG05:file_enabled="+ file_enabled);
        
    def tmp_string = org.apache.commons.lang.StringEscapeUtils.escapeXml(sb_html.toString());
    
    sb_html.setLength(0);
    
        sb_html.append("<pre>");
    sb_html.append(tmp_string);
    sb_html.append("</pre>");
    
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  SAVE_MPL01");
        
        if (mpl_enabled) {
            def messageLog = messageLogFactory.getMessageLog(message);
            def mpl_prefix = prefix;
            if (prefix.startsWith(message.exchange.getContext().getName()+'_')) {
               mpl_prefix = prefix.substring(message.exchange.getContext().getName().length()+1);
            }
            messageLog.addAttachmentAsString(mpl_prefix, sb_text.toString(), "text/plain");
        }
        
        log.debug("processHeadersAndProperties: " +prefix_with_vars +"  SAVE_FILE01");
        
        if (file_enabled) {
            ExecutorService pool = Executors.newSingleThreadExecutor();
            def task = {c -> pool.submit( c as Callable)}
            task{saveFile(""+prefix+".html", sb_html.toString().getBytes())};
        }
    log.debug("processHeadersAndProperties: " +prefix_with_vars +"  FINISH");
    
    } catch (Exception ex01) {
        log.error("processHeadersAndProperties: " +prefix_with_vars +" ",ex01)
        StringWriter sw = new StringWriter();
        ex01.printStackTrace(new PrintWriter(sw));
        log.info(sw.toString());
    }
    
}
public String safeClassName(Object obj) {
     if (obj == null) return "";
   return obj.getClass().getName();
}

public Object safeEscapeXml(Object payload) {
  if (payload instanceof java.lang.String) {
    return payload;
//    return org.apache.commons.lang.StringEscapeUtils.escapeXml(ex.getResponseBody());
  } else if (payload instanceof byte[]) {
    return payload;
//    return org.apache.commons.lang.StringEscapeUtils.escapeXml(ex.getResponseBody());
  } else if (payload instanceof Node) {
    return printXML(payload);
//    return org.apache.commons.lang.StringEscapeUtils.escapeXml(printXML(payload));
  }
    return payload;
}


public String printNode2(Node doc) throws IOException, TransformerException {
  def out = new ByteArrayOutputStream();
  TransformerFactory tf = TransformerFactory.newInstance();
  Transformer transformer = tf.newTransformer();
  transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
  transformer.setOutputProperty(OutputKeys.METHOD, "xml");
  transformer.setOutputProperty(OutputKeys.INDENT, "yes");
  transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
  transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");

  transformer.transform(new DOMSource(doc),
     new StreamResult(new OutputStreamWriter(out, "UTF-8")));
   def result = new String(out.toByteArray(), "UTF-8");
}


public byte[] readInputStream(InputStream inputStream) {

    if (inputStream==null) return null;
  def result = new ByteArrayOutputStream();
  def buffer = new byte[1024];
  def length;
  while ((length = inputStream.read(buffer)) != -1) {
    result.write(buffer, 0, length);
  }
  def byteArray = result.toByteArray();
  
  return byteArray;
}
public void saveFile(String fileName, byte[] bytes) {
    try {
        def String METVIEWER_FOLDER = "metviewer";
        java.nio.file.Path path = Paths.get(METVIEWER_FOLDER+"/"+fileName);
        path.toFile().delete();
        path.getParent().toFile().mkdir();
        if (bytes!=null) {
            Files.write(path, bytes, StandardOpenOption.CREATE);
        } else {
            Files.write(path, "".getBytes(), StandardOpenOption.CREATE);
        }
    } catch (Exception ex) {
        log.error("saveFile.exception: filename:"+fileName+" ex:"+ex);
        throw new RuntimeException(ex);
    }
}




public void dumpProperties(String title, Map<String, Object> map, StringBuffer sb) {
    sb.append(title+"\n");
    for (String key : map.keySet()) {
        sb.append(key+"\t"+map.get(key)+"\n");
    }
}

public void dumpProperties_HTML(String title, Map<String, Object> map, StringBuffer sb) {
    sb.append("<h1>"+title+"</h1><br>\n");
    sb.append("<table>\n");
    for (String key : map.keySet()) {
        sb.append("<tr>\n");
        sb.append("<td>"+key+"</td><td>"+map.get(key)+"</td>\n");
        sb.append("</tr>\n");
    }
    sb.append("</table>\n");
}

public void dumpProperties_TEXT_escaped(String title, Map<String, Object> map, StringBuffer sb) {
  sb.append(safeEscapeXml(title)+"\n");
  for (String key : map.keySet()) {
    sb.append(String.format(" %-40s: %-40s\n",safeEscapeXml(key), safeEscapeXml(map.get(key))));
  }
  sb.append("\n");
}



public void dumpProperties_TEXT(String title, Map<String, Object> map, StringBuffer sb) {
    sb.append(title+"\n");
    for (String key : map.keySet()) {
        sb.append(String.format(" %-40s: %-40s\n",key, map.get(key)));
    }
    sb.append("\n");
}
