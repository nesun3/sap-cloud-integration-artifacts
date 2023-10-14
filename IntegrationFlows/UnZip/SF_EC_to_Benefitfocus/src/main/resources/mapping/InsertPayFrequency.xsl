<xsl:stylesheet version="2.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
      <xsl:param name="PayFrequency_ext" />
   
   
      <xsl:template match="@*|node()">
            <xsl:copy>
                  <xsl:apply-templates select="@*|node()" />
            </xsl:copy>
      </xsl:template>
      <xsl:template match="/queryCompoundEmployeeResponse/CompoundEmployee/person">
            <xsl:copy-of select="." />
            <pay_Frequency>
                  <xsl:value-of select="$PayFrequency_ext" />
            </pay_Frequency>
      </xsl:template>
</xsl:stylesheet>
