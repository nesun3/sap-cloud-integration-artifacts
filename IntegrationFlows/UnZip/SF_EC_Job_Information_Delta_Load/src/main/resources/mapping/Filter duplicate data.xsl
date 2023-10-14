<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	    <FODepartment>
	        <xsl:for-each select="//externalCode[not(.=following::externalCode)]">
	           <externalCode><xsl:value-of select="."/></externalCode>
	        </xsl:for-each>
	    </FODepartment>
	</xsl:template>
</xsl:stylesheet>
