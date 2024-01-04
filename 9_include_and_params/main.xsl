<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="included.xsl"/>
    <xsl:template match="/">
        <html>
            <body>
                <h2>Main Stylesheet</h2>
                <xsl:apply-templates select="//message"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>