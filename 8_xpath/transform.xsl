<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <activeEmployees>
            <xsl:apply-templates select="//employee[status='Active']"/>
        </activeEmployees>
    </xsl:template>

    <xsl:template match="employee">
        <employee>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="department">
                <xsl:value-of select="ancestor::department/@name"/>
            </xsl:attribute>
            <xsl:copy-of select="firstName|lastName"/>
        </employee>
    </xsl:template>
</xsl:stylesheet>