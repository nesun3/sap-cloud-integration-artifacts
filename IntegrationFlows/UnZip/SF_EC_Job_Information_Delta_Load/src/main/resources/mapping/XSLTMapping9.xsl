<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<EmpJob>
<xsl:for-each select="/EmpJob/EmpJob">
<xsl:sort select="startDate"/>
<xsl:sort select="seqNumber"/>
<xsl:copy>
<xsl:copy-of select="node()|@*"/>
</xsl:copy>
</xsl:for-each>
</EmpJob>
</xsl:template>
</xsl:stylesheet>