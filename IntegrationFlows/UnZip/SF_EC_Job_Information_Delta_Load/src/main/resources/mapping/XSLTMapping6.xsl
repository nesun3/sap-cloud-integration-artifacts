<xsl:stylesheet version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>


	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
<!--	
	<xsl:template match="/EmpJob/value">
	 <value>
	 <uniqueKey><xsl:value-of select="./userId_seq" /></uniqueKey>  
	 <xsl:value-of select="./workscheduleCode" disable-output-escaping="yes"/>    
	    
    </value>

	</xsl:template>


<xsl:template match="/">
	    <messages>
    	    <xsl:for-each select="//Request/EmpJob/EmpJob">
    	        <xsl:variable name="p_userId" select="./userId"/>
    	        <xsl:variable name="p_startDate" select="./startDate"/>
    	        <xsl:variable name="p_seqNumber" select="./seqNumber"/>
   
	     <xsl:copy-of select="." />

	    
	    <xsl:copy>
        <xsl:apply-templates select="//Response/EmpJob/value[@userId=$p_userId and @startDate=$p_startDate and @seqNumber=$p_seqNumber]"/>
        <xsl:copy-of select="//Response/EmpJob/value/uniquekey" />
    	 </xsl:copy>       
    	    </xsl:for-each>
	    </messages>
	</xsl:template>
	<xsl:template match="*">
        <xsl:copy-of select="."/>
	</xsl:template>
	
-->
	<xsl:template match="//Request/EmpJob/EmpJob">
		<xsl:variable name="p_userId" select="./userId"/>
    	        <xsl:variable name="p_startDate" select="./startDate"/>
    	        <xsl:variable name="p_seqNumber" select="./seqNumber"/>
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates select="//Response/EmpJob/value[@userId=$p_userId and @startDate=$p_startDate and @seqNumber=$p_seqNumber]"/>
		</xsl:copy>
	</xsl:template>
 	
</xsl:stylesheet>
