<?xml version="1.0" encoding="UTF-8"?>
<!--
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<root>
		    <xsl:for-each-group select="/EmpJob/EmpJob" group-by="./userId">
		        <sampleEmployees>

		            <xsl:attribute name="userId"><xsl:value-of select="./userId"/></xsl:attribute>

		             <userId><xsl:value-of select="./userId"/></userId>
		             <startDate><xsl:value-of select="./startDate"/></startDate>
		            <seqNumber><xsl:value-of select="./seqNumber"/></seqNumber>
		            <Record>
        		      <xsl:copy-of select="current-group()"/>
        		    </Record>
		        </sampleEmployees>
		    </xsl:for-each-group>
		</root>
	</xsl:template>
</xsl:stylesheet>
-->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/EmpJob/EmpJob">
	<!--	<xsl:copy-of select="." /> -->
	<xsl:copy>
	    <action>N</action>
        <xsl:apply-templates/>
    </xsl:copy>

	</xsl:template>

</xsl:stylesheet>