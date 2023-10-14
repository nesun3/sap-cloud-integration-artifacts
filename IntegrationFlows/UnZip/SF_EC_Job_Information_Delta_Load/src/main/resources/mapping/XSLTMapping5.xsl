<xsl:stylesheet version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>


	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	

	<xsl:template match="/EmpJob/value/EmpJob">
 	<xsl:copy>
	    <xsl:copy-of select="../uniqueKey" />
        <xsl:apply-templates/>
    </xsl:copy>

	</xsl:template>
 	
</xsl:stylesheet>