<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Resume of SECK Aloyse Maliam</title>
                <link rel="stylesheet" type="text/css" href="/static/portfolio/css/cv_style.css" />
                <link rel="stylesheet" type="text/css" href="/static/portfolio/css/home_style.css" />
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
                    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
                    crossorigin="anonymous" />
                <link
                    href="https://fonts.googleapis.com/css2?family=Castoro:wght@400;700&amp;display=swap"
                    rel="stylesheet" />
            </head>
            <body>
                <xsl:copy-of select="document('../../../templates/header.html')/*" /> <!-- HEADER -->
                <main class="CV">
                    <h1>
                        <xsl:value-of select="resume/personalInfo/name" />
                    </h1>
                    <h3>
                        <xsl:value-of select="resume/personalInfo/title" />
                    </h3>
                    <div class="section">
                        <span class="contact-info">
                            Phone:
                            <xsl:value-of select="resume/personalInfo/contact/phone" />
                        </span>
                        <br />
                        <span class="contact-info">
                            Email:
                            <xsl:value-of select="resume/personalInfo/contact/email" />
                        </span>
                        <br />
                        <span class="contact-info">
                            Location:
                            <xsl:value-of select="resume/personalInfo/contact/location" />
                        </span>
                        <br />
                        <span class="contact-info">
                            Availability:
                            <xsl:value-of select="resume/personalInfo/availability" />
                        </span>
                        <br />
                        <span class="contact-info">
                            Age:
                            <xsl:value-of select="resume/personalInfo/age" />
                        </span>
                        <br />
                    </div>
                    <div class="section">
                        <div class="section-title">Objective</div>
                        <p>
                            <xsl:value-of select="resume/objective" />
                            <br />
                            <xsl:value-of select="resume/objective/duration" />
                        </p>
                    </div>
                    <div class="section">
                        <div class="section-title">Projects</div>
                        <xsl:for-each select="resume/projects/project">
                            <div class="project">
                                <div class="project-title">
                                    Title:
                                    <xsl:value-of select="title" />
                                </div>
                                <div class="project-institution">
                                    Institution:
                                    <xsl:value-of select="institution" />
                                </div>
                                <div class="project-date">
                                    Date:
                                    <xsl:value-of select="date" />
                                </div>
                                <div class="project-description">
                                    Description:
                                    <xsl:value-of select="description" />
                                </div>
                                <div class="project-tools">
                                    Tools:
                                    <xsl:value-of select="tools" />
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">Education</div>
                        <xsl:for-each select="resume/education/degree">
                            <div class="degree">
                                <div class="degree-title">
                                    Degree:
                                    <xsl:value-of select="title" />
                                </div>
                                <div class="degree-institution">
                                    Institution:
                                    <xsl:value-of select="institution" />
                                </div>
                                <div class="degree-date">
                                    Date:
                                    <xsl:value-of select="date" />
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">Languages</div>
                        <xsl:for-each select="resume/languages/language">
                            <div class="language">
                                <div class="language-name">
                                    Language:
                                    <xsl:value-of select="name" />
                                </div>
                                <div class="language-level">
                                    Level:
                                    <xsl:value-of select="level" />
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">Skills</div>
                        <xsl:for-each select="resume/skills/category">
                            <div class="skill-category">
                                <div class="category-name">
                                    <xsl:value-of select="@name" />:
                                </div>
                                <xsl:for-each select="skill">
                                    <div class="skill">
                                        <xsl:value-of select="." />
                                    </div>
                                </xsl:for-each>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">Attributes</div>
                        <xsl:for-each select="resume/attributes/attribute">
                            <div class="attribute">
                                <xsl:value-of select="." />
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">Interests</div>
                        <xsl:for-each select="resume/interests/interest">
                            <div class="interest">
                                <xsl:value-of select="." />
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">Links</div>
                        <xsl:for-each select="resume/links/link">
                            <div class="link">
                                <a href="{.}" target="_blank">
                                    <xsl:value-of select="." />
                                </a>
                            </div>
                        </xsl:for-each>
                    </div>
                </main>
                <xsl:copy-of select="document('../../../templates/footer.html')/*" /> <!-- FOOTER -->
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
                    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
                    integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
                    crossorigin="anonymous"></script>
                <script>
                    function updateButtonText(element) {
                    var button = document.getElementById('dropdownMenuButton');
                    button.textContent = element.textContent;
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>