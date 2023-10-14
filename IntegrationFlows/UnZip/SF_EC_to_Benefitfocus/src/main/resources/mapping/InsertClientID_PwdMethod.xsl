<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="BenefitFocusClientID" />
	<xsl:param name="PasswordMethod" />
	<xsl:param name="BenefitFocusLoginIDMethod" />
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="ClientID">
	<xsl:choose>
	<xsl:when test="$BenefitFocusClientID=''">
	<ClientID><xsl:value-of select="'Set Value Of BenefitFocus Client ID In External Parameters'" /></ClientID>
	</xsl:when>
	<xsl:otherwise><ClientID><xsl:value-of select="$BenefitFocusClientID" /></ClientID></xsl:otherwise>
	</xsl:choose>
	</xsl:template>
	
	<xsl:template match="PasswordMethod">
	<PasswordMethod><xsl:value-of select="$PasswordMethod" /></PasswordMethod>
	</xsl:template>
	
	<xsl:template match="LoginIDMethod">
	<xsl:choose>
	  <xsl:when test="$BenefitFocusLoginIDMethod=1 or $BenefitFocusLoginIDMethod=2">
	    <LoginIDMethod><xsl:value-of select="$BenefitFocusLoginIDMethod" /></LoginIDMethod>
	  </xsl:when>
	  <xsl:otherwise>
	    <LoginIDMethod>Y</LoginIDMethod>
	  </xsl:otherwise>
	</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>