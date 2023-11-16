<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/employees">
        <xsl:copy>
            <xsl:apply-templates select="employee"/>
            <xsl:apply-templates select="document('sample-B.xml')/staff/member"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="employee|member">
        <employee>
            <firstName><xsl:value-of select="firstName|first"/></firstName>
            <lastName><xsl:value-of select="lastName|last"/></lastName>
        </employee>
    </xsl:template>
</xsl:stylesheet>