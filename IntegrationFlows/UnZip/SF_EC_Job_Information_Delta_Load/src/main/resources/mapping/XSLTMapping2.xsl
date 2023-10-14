<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization">
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

<xsl:variable name="output">
<output:serialization-parameters>
  <output:omit-xml-declaration value="yes"/>
  <output:method value="xml"/>
</output:serialization-parameters>

</xsl:variable>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="/EmpJob/EmpJob">
		<!--	<xsl:copy-of select="." /> -->
			<xsl:choose>
		    <xsl:when test="not(string(./employmentNav/EmpEmployment/customString1) = '') or not(string(./employmentNav/EmpEmployment/empGlobalAssignmentNav/EmpGlobalAssignment/customString101) = '') ">
		<EmpJob>

			<userId>
				<xsl:value-of select="./userId"/>
			</userId>
	        <startDate>
				<xsl:value-of select="./startDate"/>
			</startDate>
			<seqNumber>
				<xsl:value-of select="./seqNumber"/>
			</seqNumber>
			<cudKey>
				<xsl:value-of select="./cudKey"/>
			</cudKey>
			<Record>
				 <xsl:value-of select="serialize(.,$output/*)"/>
			</Record>

<!--
            <userId>
				<xsl:value-of select="./userId"/>
			</userId>
         	<endDate>
				<xsl:value-of select="./startDate"/>
			</endDate>
			<action>
				<xsl:value-of select="./seqNumber"/>
			</action>
			<workscheduleCode>&lt;EmpJob&gt;&lt;E&gt;<xsl:value-of select="./action"/>&lt;/E&gt;&lt;/EmpJob&gt;</workscheduleCode>
-->		
	</EmpJob>
           </xsl:when>
        </xsl:choose>
	
	</xsl:template>
</xsl:stylesheet>
