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
	<xsl:copy>
	    <uniquekey></uniquekey>
        <xsl:apply-templates/>
     
    </xsl:copy>

	</xsl:template>

</xsl:stylesheet>