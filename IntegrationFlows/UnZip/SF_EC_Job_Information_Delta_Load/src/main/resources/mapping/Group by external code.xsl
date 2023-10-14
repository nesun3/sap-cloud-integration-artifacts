<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<root>
		    <xsl:for-each-group select="/EmpJob/EmpJob" group-by="./userId">
		        <EmpJob>
		            <xsl:attribute name="id"><xsl:value-of select="./userId"/></xsl:attribute>
		            <userId><xsl:value-of select="./userId"/></userId>
        		    <xsl:copy-of select="current-group()"/>
		        </EmpJob>
		    </xsl:for-each-group>
		</root>
	</xsl:template>
</xsl:stylesheet>
