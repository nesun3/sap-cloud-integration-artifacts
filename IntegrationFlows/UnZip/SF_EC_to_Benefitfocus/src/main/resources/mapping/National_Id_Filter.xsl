<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<queryCompoundEmployeeResponse>
			<xsl:for-each select="queryCompoundEmployeeResponse/CompoundEmployee">
				<xsl:variable name="var_compEmp" select="./*[not(name()='person')]" />
				<xsl:for-each select="person">
					<xsl:variable name="var_person"
						select="./*[not(name()='national_id_card')]"></xsl:variable>
					<CompoundEmployee>
						<xsl:copy-of select="$var_compEmp" />
						<person>
							<xsl:copy-of select="$var_person" />
							<xsl:for-each select="national_id_card">
								<xsl:if test="country='USA'">
									<xsl:variable name="var_national_id_card" select="."></xsl:variable>
									<xsl:copy-of select="$var_national_id_card" />
								</xsl:if>
							</xsl:for-each>
						</person>
					</CompoundEmployee>
				</xsl:for-each>
			</xsl:for-each>
		</queryCompoundEmployeeResponse>
	</xsl:template>
</xsl:stylesheet>