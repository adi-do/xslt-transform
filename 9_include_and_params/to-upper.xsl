<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- match the "from" attribute of the messages/message elements-->
    <xsl:template match="root/messages">
        <from>
            <!-- select the value of the "from" attribute-->
            <xsl:value-of select="@from"/>
        </from>
    </xsl:template>

</xsl:stylesheet>