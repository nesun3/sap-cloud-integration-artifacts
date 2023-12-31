﻿<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" />
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*" />
    </xsl:copy>
  </xsl:template>
  <xsl:template match="EmpJob">
    <EmpJob>
      <xsl:for-each-group select="EmpJob" group-by="userId">
        <EmpJob>
          <xsl:apply-templates select="userId" />
        </EmpJob>
      </xsl:for-each-group>
    </EmpJob>
  </xsl:template>
</xsl:stylesheet>