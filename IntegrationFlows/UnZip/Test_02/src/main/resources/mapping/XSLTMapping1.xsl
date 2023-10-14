<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/Hello-world">
		<HTML>
			<HEAD>
				<TITLE/>
			</HEAD>
			<BODY>
				<H1>
					<xsl:value-of select="greeting"/>
				</H1>
				<xsl:apply-templates select="greeter"/>
			</BODY>
		</HTML>
	</xsl:template>
	<xsl:template match="greeter">
		<DIV>from <I>
				<xsl:value-of select="."/>
			</I>
		</DIV>
	</xsl:template>
</xsl:stylesheet>
