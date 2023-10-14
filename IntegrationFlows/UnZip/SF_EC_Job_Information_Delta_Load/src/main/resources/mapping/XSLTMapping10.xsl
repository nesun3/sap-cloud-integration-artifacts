<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/EmpJob/EmpJob">
	    <EmpJob>
    		<GA_endDate>
    			<xsl:value-of select="./employmentNav/EmpEmployment/personNav/PerPerson/employmentNav/EmpEmployment[assignmentClass='GA']/empGlobalAssignmentNav/EmpGlobalAssignment/endDate"/>
    		</GA_endDate>
    		<GA_startDate>
    			<xsl:value-of select="./employmentNav/EmpEmployment/personNav/PerPerson/employmentNav/EmpEmployment[assignmentClass='GA']/empGlobalAssignmentNav/EmpGlobalAssignment/startDate"/>
    		</GA_startDate>
    		<GA_plannedEndDate>
    			<xsl:value-of select="./employmentNav/EmpEmployment/personNav/PerPerson/employmentNav/EmpEmployment[assignmentClass='GA']/empGlobalAssignmentNav/EmpGlobalAssignment/plannedEndDate"/>
    		</GA_plannedEndDate>
    		<xsl:apply-templates/>
		</EmpJob>
	</xsl:template>
</xsl:stylesheet>
