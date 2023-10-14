<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/EmpJob/EmpJob">
	<!--	<xsl:copy-of select="." /> -->
	<xsl:choose>
		    <xsl:when test="not(string(./employmentNav/EmpEmployment/customString1) = '') or not(string(./employmentNav/EmpEmployment/empGlobalAssignmentNav/EmpGlobalAssignment/customString101) = '') ">
		        
	<xsl:copy>
	    <cudKey></cudKey>
        <xsl:apply-templates/>
     
    </xsl:copy>
           </xsl:when>
    </xsl:choose>
    
	</xsl:template>

</xsl:stylesheet>