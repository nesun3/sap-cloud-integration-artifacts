import com.sap.gateway.ip.core.customdev.util.Message
// Version 1.0
// save attachments to log and build error email body
def Message processData(Message message) {
    def map = message.getProperties()
    def headers = message.getHeaders()
    def add_to_log_property = message.getProperty("ErrorLogAttachments") ?: 'false'
    def add_to_log = (add_to_log_property ==~ /(?i)(true|x)/)
    def email_body = ''
    def headers_text = ''
    def lv_ErrorModelStepID_HANACloud = message.getProperty("ErrorModelStepID_HANACloud")
    def lv_ErrorModelStepID_GCP = message.getProperty("ErrorModelStepID_GCP")
    // get an exception java class instance
    def ex = map.get('CamelExceptionCaught')
    if (ex != null) {
        // fill only minimal information into email body
        email_body = "Iflow: Iflow: SAP SuccessFactors Integration_GCP-Delta_JobInformation" + "\n"
        email_body += "MPL ID: " + map.get("SAP_MessageProcessingLogID") + "\n" 
        email_body += "Correlation ID: " + headers.get("SAP_MplCorrelationId") + "\n" 
        email_body += "Timestamp: " + map.get("CamelCreatedTimestamp") + "\n"
        email_body += "\n" + "ErrorResponse: " + map.get("CamelExceptionCaught") + "\n"
        email_body +="\n" + "SAP_ErrorModelStepID: " + map.get("SAP_ErrorModelStepID") + "\n"


    }

    message.setBody(email_body)
    return message
}