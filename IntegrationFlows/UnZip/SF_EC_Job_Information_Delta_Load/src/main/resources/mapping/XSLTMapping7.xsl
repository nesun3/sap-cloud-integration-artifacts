<xsl:stylesheet version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>


	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="/EmpJob/EmpJob">

	     
	 <xsl:value-of select="./Record" disable-output-escaping="yes"/>  
	    


	</xsl:template>
 	
</xsl:stylesheet>
