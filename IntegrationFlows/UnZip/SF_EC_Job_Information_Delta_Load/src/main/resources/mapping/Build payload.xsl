<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cpi="http://sap.com/it/" exclude-result-prefixes="cpi" version="2.0">
    <xsl:param name="ExternalCode"/>
	
	<xsl:template match="/root">
	    <FODepartment>
	        <xsl:apply-templates select="*[@id=$ExternalCode]"/>
	    </FODepartment>
	</xsl:template>
	<xsl:template match="*">
    	<xsl:for-each select="child::*">
    	    <xsl:copy>
    	        <xsl:copy-of select="node()|@*"/>
            </xsl:copy>
        </xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
