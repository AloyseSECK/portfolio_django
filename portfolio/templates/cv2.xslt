<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Resume of SECK Aloyse Maliam</title>
                <style>
                    body {font-family: Arial, sans-serif;}
                    .section {margin-bottom: 20px;}
                    .section-title {font-size: 18px; font-weight: bold; margin-top: 20px;}
                    .project, .degree, .language, .skill-category, .attribute, .interest {margin-left: 20px;}
                </style>
            </head>
            <body>
                <h1><xsl:value-of select="resume/personalInfo/name"/></h1>
                <h2><xsl:value-of select="resume/personalInfo/title"/></h2>
                <div class="section">
                    <span><b>Phone:</b> <xsl:value-of select="resume/personalInfo/contact/phone"/></span><br/>
                    <span><b>Email:</b> <xsl:value-of select="resume/personalInfo/contact/email"/></span><br/>
                    <span><b>Location:</b> <xsl:value-of select="resume/personalInfo/contact/location"/></span><br/>
                    <span><b>Availability:</b> <xsl:value-of select="resume/personalInfo/availability"/></span><br/>
                    <span><b>Age:</b> <xsl:value-of select="resume/personalInfo/age"/></span><br/>
                </div>
                <div class="section">
                    <div class="section-title">Objective</div>
                    <p>
                        <xsl:value-of select="resume/objective"/> <br/>
                        <xsl:value-of select="resume/objective/duration"/>
                    </p>
                </div>
                <div class="section">
                    <div class="section-title">Projects</div>
                    <xsl:for-each select="resume/projects/project">
                        <div class="project">
                            <div><b>Title:</b> <xsl:value-of select="title"/></div>
                            <div><b>Institution:</b> <xsl:value-of select="institution"/></div>
                            <div><b>Date:</b> <xsl:value-of select="date"/></div>
                            <div><b>Description:</b> <xsl:value-of select="description"/></div>
                            <div><b>Tools:</b> <xsl:value-of select="tools"/></div>
                        </div>
                    </xsl:for-each>
                </div>
                <div class="section">
                    <div class="section-title">Education</div>
                    <xsl:for-each select="resume/education/degree">
                        <div class="degree">
                            <div><b>Degree:</b> <xsl:value-of select="title"/></div>
                            <div><b>Institution:</b> <xsl:value-of select="institution"/></div>
                            <div><b>Date:</b> <xsl:value-of select="date"/></div>
                        </div>
                    </xsl:for-each>
                </div>
                <div class="section">
                    <div class="section-title">Languages</div>
                    <xsl:for-each select="resume/languages/language">
                        <div class="language">
                            <div><b>Language:</b> <xsl:value-of select="name"/></div>
                            <div><b>Level:</b> <xsl:value-of select="level"/></div>
                        </div>
                    </xsl:for-each>
                </div>
                <div class="section">
                    <div class="section-title">Skills</div>
                    <xsl:for-each select="resume/skills/category">
                        <div class="skill-category">
                            <div><b><xsl:value-of select="@name"/>:</b></div>
                            <xsl:for-each select="skill">
                                <div class="skill"><xsl:value-of select="."/></div>
                            </xsl:for-each>
                        </div>
                    </xsl:for-each>
                </div>
                <div class="section">
                    <div class="section-title">Attributes</div>
                    <xsl:for-each select="resume/attributes/attribute">
                        <div class="attribute"><xsl:value-of select="."/></div>
                    </xsl:for-each>
                </div>
                <div class="section">
                    <div class="section-title">Interests</div>
                    <xsl:for-each select="resume/interests/interest">
                        <div class="interest"><xsl:value-of select="."/></div>
                    </xsl:for-each>
                </div>
                <div class="section">
                    <div class="section-title">Links</div>
                    <xsl:for-each select="resume/links/link">
                        <div class="link"><a href="{.}" target="_blank"><xsl:value-of select="."/></a></div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
