<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" />
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="/queryPaymaxResponse/paymax/HomePhone">
	<xsl:variable name="in" select="."/>
	<HomePhone>
<xsl:value-of select="substring(replace($in,'[^0-9]',''),1,10)"/>	</HomePhone>
	</xsl:template>
	
	<xsl:template match="/queryPaymaxResponse/paymax/CellPhone">
	<xsl:variable name="in" select="."/>	
	<CellPhone>
 <xsl:value-of select="substring(replace($in,'[^0-9]',''),1,10)"/></CellPhone>
	</xsl:template>
	
	<xsl:template match="/queryPaymaxResponse/paymax/WorkPhone">
	<xsl:variable name="in" select="."/>
	<WorkPhone>
  <xsl:value-of select="substring(replace($in,'[^0-9]',''),1,10)"/>
	</WorkPhone>
	</xsl:template>
	
	<xsl:template match="/queryPaymaxResponse/paymax/EmergencyContactPhone">
	<xsl:variable name="in" select="."/>
	<EmergencyContactPhone>
  <xsl:value-of select="substring(replace($in,'[^0-9]',''),1,10)"/>
	</EmergencyContactPhone>
	</xsl:template>
	
	<xsl:template match="/queryPaymaxResponse/paymax/EmergencyContactAlternatePhone">
	<xsl:variable name="in" select="."/>
	<EmergencyContactAlternatePhone>
  <xsl:value-of select="substring(replace($in,'[^0-9]',''),1,10)"/>
	</EmergencyContactAlternatePhone>
	</xsl:template>
	
	<xsl:template match="/queryPaymaxResponse/paymax/AddressLine1">
	<xsl:variable name="in" select="."/>
	<AddressLine1>
  <xsl:value-of select="substring($in,1,50)"/>
	</AddressLine1>
	</xsl:template>
	
	
	<xsl:template match="/queryPaymaxResponse/paymax/AddressLine2">
	<xsl:variable name="in" select="."/>
	<AddressLine2>
  <xsl:value-of select="substring($in,1,50)"/>
	</AddressLine2>
	</xsl:template>

</xsl:stylesheet>