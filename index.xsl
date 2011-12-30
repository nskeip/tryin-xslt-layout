<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="block">
    <xsl:apply-templates select="document(.)"/>
</xsl:template>

<xsl:template match="goods">
    <ul>
        <xsl:apply-templates />
    </ul>
</xsl:template>

<xsl:template match="good">
    <li>
        <a href="{url}"><xsl:value-of select="name"/></a><br/>
        <xsl:value-of select="description"/>
    </li>
</xsl:template>

<xsl:template match="about">
    <div>
        <span class="category">
            <xsl:value-of select="category"/>
        </span>&#160;<span class="fn org">
            <xsl:value-of select="fn_org"/>
        </span>
    </div>
    <div class="adr">
        <span class="locality"><xsl:value-of select="adr/locality"/></span>,
        <span class="locality"><xsl:value-of select="adr/street-addres"/></span>
    </div>
    <div>
        Телефон: <span class="tel"><xsl:value-of select="tel"/></span></div>
    <div>
        Мы работаем: 
            <span class="workgours"><xsl:value-of select="workhours"/></span>
    </div>
</xsl:template>

<xsl:template match="/page">
    <html>
        <head>
            <title>главная в магазине примеров</title>
            <link href="index.css" rel="stylesheet" type="text/css" />
        </head>
        <body>
            <h1 class="page__h1">Магазин примеров XSLT</h1>
            <div class="goods__div">
                <xsl:apply-templates select="/page/block[text()='goods.xml']"/>
            </div>
            <div class="vcard_about__div">
                <xsl:apply-templates select="/page/block[text()='about.xml']"/>
            </div>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>
