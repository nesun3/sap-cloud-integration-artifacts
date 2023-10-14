/*
 * The integration developer needs to create the method processData 
 * This method takes Message object of package com.sap.gateway.ip.core.customdev.util
 * which includes helper methods useful for the content developer:
 * 
 * The methods available are:
    public java.lang.Object getBody()

    public void setBody(java.lang.Object exchangeBody)

    public java.util.Map<java.lang.String,java.lang.Object> getHeaders()

    public void setHeaders(java.util.Map<java.lang.String,java.lang.Object> exchangeHeaders)

    public void setHeader(java.lang.String name, java.lang.Object value)

    public java.util.Map<java.lang.String,java.lang.Object> getProperties()

    public void setProperties(java.util.Map<java.lang.String,java.lang.Object> exchangeProperties) 

	public void setProperty(java.lang.String name, java.lang.Object value)
 * 
 */
import com.sap.gateway.ip.core.customdev.util.Message;
import java.util.HashMap;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

def Message processData(Message message) {
	
	//Body 
	def body = message.getBody();
	//message.setBody(body + " ");
	
	StringBuffer str = new StringBuffer();
	
	//Headers 
	def pMap = message.getProperties();
	def company_ext = pMap.get("company");
	def employee_class_ext = pMap.get("employee_class");
	def company_territory_code_ext = pMap.get("company_territory_code");
	def business_unit_ext = pMap.get("business_unit");
	def location_ext = pMap.get("location");
	def pay_group_ext = pMap.get("pay_group");
	def person_id_external_ext = pMap.get("person_id_external");
	
	DateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	
	str.append("effective_end_date=to_date('" + dateFormat.format(date) + "') ");	
	
	if(!(company_ext.trim().isEmpty()))
	{
		str.append("and company in(" + company_ext +") ");	
	}
	if(!(employee_class_ext.trim().isEmpty()))
	{
		str.append("and employee_class in(" + employee_class_ext + ") ");
	}
	if(!(company_territory_code_ext.trim().isEmpty()))
	{
		str.append("and company_territory_code in(" + company_territory_code_ext +") ");
	}
	if((company_territory_code_ext.trim().isEmpty()))
	{
		str.append("and company_territory_code in('USA') ");
	}
	if(!(business_unit_ext.trim().isEmpty()))
	{
		str.append("and business_unit in(" + business_unit_ext +") ");
	}
	if(!(location_ext.trim().isEmpty()))
	{
		str.append("and location in(" + location_ext +") ");
	}
	if(!(pay_group_ext.trim().isEmpty()))
	{
		str.append("and pay_group in(" + pay_group_ext +") ");
	}
	if(!(person_id_external_ext.trim().isEmpty()))
	{
		str.append("and person_id_external in(" + person_id_external_ext +") ");
	}
	
	str.append("and hiringNotCompleted = 'false'");
	
	//def val = str.toString().replace(",","','")
	

	message.setProperty("QueryFilter",str.toString());
	//message.setBody(val);
	
	return message;
}

