import com.sap.gateway.ip.core.customdev.util.Message;
import groovy.xml.MarkupBuilder;
import groovy.util.Node;
import java.util.HashMap;
def Message processData(Message message) {
	def body = message.getBody(java.lang.String);
	def writer = new StringWriter();
	def builder = new MarkupBuilder(writer);
	def currentEmpJobContent = message.getProperty("currentEmpJob");
	def currentEmpJobNodes = new XmlParser().parseText(currentEmpJobContent);
	HashMap<String, String> deltaMap = new HashMap<String, String>();
	HashMap<String, String> fullMap = new HashMap<String, String>();
	
		if(body == null || "-".equals(body.trim()) || "".equals(body.trim()))
	{
	     currentEmpJobNodes.EmpJob.each{ currentEmpJobNode ->
	   def lv_currentIntegrationKey = currentEmpJobNode.userId.text() + currentEmpJobNode.startDate.text() +  currentEmpJobNode.seqNumber.text();
	   
	     currentEmpJobNode.cudKey[0].value = 'C';
         deltaMap.put(lv_currentIntegrationKey,currentEmpJobNode);
         fullMap.put(lv_currentIntegrationKey,currentEmpJobNode);
	     
	     }
	}else{
	       def previousEmpJobNodes = new XmlParser().parseText(body);
	       // check the Create/Update 
	        currentEmpJobNodes.EmpJob.each{ currentEmpJobNode ->
                def lv_currentStartDate = currentEmpJobNode.startDate.text();
                def lv_currentUserId = currentEmpJobNode.userId.text();
                def lv_currentSeqNumber = currentEmpJobNode.seqNumber.text();
                def lv_currentEndDate = currentEmpJobNode.endDate.text();
                def lv_currentIntegrationKey = currentEmpJobNode.userId.text() + currentEmpJobNode.startDate.text() +  currentEmpJobNode.seqNumber.text();
                def lv_currentLastModifiedOn = currentEmpJobNode.lastModifiedOn.text();
                def lv_currentEEstring1 = currentEmpJobNode.employmentNav.EmpEmployment.customString1.text();
                def lv_currentEEstring6 = currentEmpJobNode.employmentNav.EmpEmployment.customString6.text();
                def lv_currentGAendDate =currentEmpJobNode.employmentNav.EmpEmployment.empGlobalAssignmentNav.EmpGlobalAssignment.endDate.text();
                def lv_currentGAplannedEndDate =currentEmpJobNode.employmentNav.EmpEmployment.empGlobalAssignmentNav.EmpGlobalAssignment.plannedEndDate.text();
                def lv_currentGAstartDate =currentEmpJobNode.employmentNav.EmpEmployment.empGlobalAssignmentNav.EmpGlobalAssignment.startDate.text();
                def lv_currentGAstring101 =currentEmpJobNode.employmentNav.EmpEmployment.empGlobalAssignmentNav.EmpGlobalAssignment.customString101.text();
                  
          
                    if(!lv_currentIntegrationKey) {  
                    return;
                }
                
                def previousEmpJobNode = previousEmpJobNodes.EmpJob.find{
                    it.userId.text() == lv_currentUserId && it.startDate.text() == lv_currentStartDate && it.seqNumber.text() == lv_currentSeqNumber
                }
                        
        
                     if(!previousEmpJobNode){
                    //Cannot find previous record of EmpJob from HANA Cloud. - Create
                   currentEmpJobNode.cudKey[0].value = 'C';
                   deltaMap.put(lv_currentIntegrationKey,currentEmpJobNode);
                   fullMap.put(lv_currentIntegrationKey,currentEmpJobNode);
                }else{
                    def previousEmpJobNode1 = previousEmpJobNodes.EmpJob.find{
                    it.userId.text() == lv_currentUserId && it.startDate.text() == lv_currentStartDate && it.seqNumber.text() == lv_currentSeqNumber && (it.endDate.text() != lv_currentEndDate || it.lastModifiedOn.text() != lv_currentLastModifiedOn || it.employmentNav.EmpEmployment.customString1.text() != lv_currentEEstring1 || it.employmentNav.EmpEmployment.customString6.text() != lv_currentEEstring6 || it.employmentNav.EmpEmployment.empGlobalAssignmentNav.EmpGlobalAssignment.startDate.text() != lv_currentGAstartDate || it.employmentNav.EmpEmployment.empGlobalAssignmentNav.EmpGlobalAssignment.plannedEndDate.text() != lv_currentGAplannedEndDate || it.employmentNav.EmpEmployment.empGlobalAssignmentNav.EmpGlobalAssignment.endDate.text() != lv_currentGAendDate || it.employmentNav.EmpEmployment.empGlobalAssignmentNav.EmpGlobalAssignment.customString101.text() != lv_currentGAstring101)
                    }
              
                         if(previousEmpJobNode1){
                        //Cannot find previous record of EmpJob from HANA Cloud. - change
                         currentEmpJobNode.cudKey[0].value = 'U';
                         deltaMap.put(lv_currentIntegrationKey,currentEmpJobNode);
                         fullMap.put(lv_currentIntegrationKey,currentEmpJobNode);
                    }else{
                        fullMap.put(lv_currentIntegrationKey,previousEmpJobNode);
                    }
                }
	       }
	       
	        // check the Delete 
	        previousEmpJobNodes.EmpJob.each{ previousEmpJobNode ->
                def lv_previousUserId = previousEmpJobNode.userId.text();
                def lv_previousIntegrationKey = previousEmpJobNode.userId.text() + previousEmpJobNode.startDate.text() +  previousEmpJobNode.seqNumber.text();
                def lv_previousStartDate = previousEmpJobNode.startDate.text();
                def lv_previousSeqNumber = previousEmpJobNode.seqNumber.text();
                def lv_previouscudKey = previousEmpJobNode.cudKey.text();
                  
        
                  if(!lv_previousIntegrationKey){
                    fullMap.put(lv_previousIntegrationKey,previousEmpJobNode);
                    return;
                }
                
                // if("D".equals(lv_previouscudKey)){
                //     fullMap.put(lv_previousIntegrationKey,previousEmpJobNode);
                //     return;
                // }
                
                def currentEmpJobNode = currentEmpJobNodes.EmpJob.find{
                    it.userId.text() == lv_previousUserId && it.startDate.text() == lv_previousStartDate && it.seqNumber.text() == lv_previousSeqNumber
                }
                        
     
                  if(!currentEmpJobNode){
                    //Cannot find current record of EmpJob - Delete
                   previousEmpJobNode.cudKey[0].value = 'D';
                   deltaMap.put(lv_previousIntegrationKey,previousEmpJobNode);
                   fullMap.put(lv_previousIntegrationKey,previousEmpJobNode);
                }
	       }
	}    
	   

	   
	   def DeltaXML = new StringBuffer();
       DeltaXML.append("<EmpJob>");  
	   for ( item in deltaMap ) {
	    def stringWriter = new StringWriter()
	    def xmlNodePrinter = new XmlNodePrinter(new PrintWriter(stringWriter));

            xmlNodePrinter.with {
                preserveWhitespace = true

            }
          xmlNodePrinter.print(item.value);

         DeltaXML.append(stringWriter.toString());
 
        }

	
	DeltaXML.append("</EmpJob>");
	
	
	message.setProperty("DeltaEmpJobs",DeltaXML.toString());

     message.setProperty("currentEmpJob",'');

    message.setBody(DeltaXML.toString());
    return message;
}