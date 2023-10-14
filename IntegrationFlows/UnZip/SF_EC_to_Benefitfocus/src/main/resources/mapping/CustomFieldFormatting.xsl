<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="CustomCategoryType1" />
	<xsl:param name="CustomCategoryType10" />
	<xsl:param name="CustomCategoryType11" />
	<xsl:param name="CustomCategoryType12" />
	<xsl:param name="CustomCategoryType13" />
	<xsl:param name="CustomCategoryType14" />
	<xsl:param name="CustomCategoryType15" />
	<xsl:param name="CustomCategoryType2" />
	<xsl:param name="CustomCategoryType3" />
	<xsl:param name="CustomCategoryType4" />
	<xsl:param name="CustomCategoryType5" />
	<xsl:param name="CustomCategoryType6" />
	<xsl:param name="CustomCategoryType7" />
	<xsl:param name="CustomCategoryType8" />
	<xsl:param name="CustomCategoryType9" />
	<xsl:param name="PayFrequency" />
	<xsl:param name="DoubleQuote">"</xsl:param>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType1">
	<CustomCategoryType1><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType1" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType1>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType2">
	<CustomCategoryType2><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType2" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType2>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType3">
	<CustomCategoryType3><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType3" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType3>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType4">
	<CustomCategoryType4><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType4" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType4>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType5">
	<CustomCategoryType5><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType5" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType5>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType6">
	<CustomCategoryType6><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType6" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType6>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType7">
	<CustomCategoryType7><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType7" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType7>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType8">
	<CustomCategoryType8><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType8" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType8>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType9">
	<CustomCategoryType9><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType9" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType9>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType10">
	<CustomCategoryType10><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType10" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType10>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType11">
	<CustomCategoryType11><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType11" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType11>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType12">
	<CustomCategoryType12><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType12" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType12>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType13">
	<CustomCategoryType13><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType13" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType13>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType14">
	<CustomCategoryType14><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType14" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType14>
	</xsl:template>
	
	<xsl:template match="CustomCategoryType15">
	<CustomCategoryType15><xsl:value-of select="$DoubleQuote"/><xsl:value-of select="$CustomCategoryType15" /><xsl:value-of select="$DoubleQuote"/></CustomCategoryType15>
	</xsl:template>
	
</xsl:stylesheet>