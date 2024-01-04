<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="message">
        <p>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>

    <xsl:template match="root/messages">
        <from>
            <xsl:value-of select="@from"/>
        </from>
    </xsl:template>

    <xsl:template match="/">
        <html>
            <body>
                <h2>Main Stylesheet</h2>
                <xsl:apply-templates select="//message"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>