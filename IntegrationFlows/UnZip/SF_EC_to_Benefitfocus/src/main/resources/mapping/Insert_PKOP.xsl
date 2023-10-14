<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="pkop" select="'PKOP-'" />
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="PerEmergencyContacts/state" >
	<xsl:variable name="var_state" select="." />
	<state>
        <xsl:value-of select="concat($pkop,$var_state)"/>                    
    </state>
	</xsl:template>

</xsl:stylesheet>