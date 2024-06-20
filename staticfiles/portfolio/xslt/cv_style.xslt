<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html lang="fr" id="html-bloc">
            <head>
                {% load i18n %}    
                <title>{% trans "Portfolio - Aloyse Maliam SECK" %}</title>
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
                <!-- HEADER -->
                <xsl:copy-of select="document('../../../templates/header.html')/*" /> 
                <main class="CV">
                    <form id="languageForm" action="/i18n/setlang/" method="post">
                        {% csrf_token %}
                        <input name="next" type="hidden" id="nextInput"/>
                        <input id="languageInput" name="language" type="hidden"/>
                    </form>
                    <h1>
                        <xsl:value-of select="resume/personalInfo/name" />
                    </h1>
                    <h3>
                        <xsl:value-of select="resume/personalInfo/title" />
                    </h3>
                    <div class="section">
                        <span class="contact-info">{% trans "Téléphone" %}: <xsl:value-of
                                select="resume/personalInfo/contact/phone" />
                        </span>
                        <br />
                        <span class="contact-info">{% trans "Adresse Email" %}: <xsl:value-of
                                select="resume/personalInfo/contact/email" />
                        </span>
                        <br />
                        <span class="contact-info">{% trans "Adresse" %}: <xsl:value-of
                                select="resume/personalInfo/contact/location" />
                        </span>
                        <br />
                        <span class="contact-info">{% trans "Disponibilité" %}: <xsl:value-of
                                select="resume/personalInfo/availability" />
                        </span>
                        <br />
                        <span class="contact-info">{% trans "Age" %}: <xsl:value-of
                                select="resume/personalInfo/age" />
                        </span>
                        <br />
                    </div>
                    <div class="section">
                        <div class="section-title">{% trans "Objectif" %}</div>
                        <p>
                            <xsl:value-of select="resume/objective" />
                            <br />
                            <xsl:value-of select="resume/objective/duration" />
                        </p>
                    </div>
                    <div class="section">
                        <div class="section-title">{% trans "Projets" %}</div>
                        <xsl:for-each select="resume/projects/project">
                            <div class="project">
                                <div class="project-title">{% trans "Titre" %}: <xsl:value-of select="title" />
                                </div>
                                <div class="project-institution">{% trans "Etablissement" %}: <xsl:value-of
                                        select="institution" />
                                </div>
                                <div class="project-date">{% trans "Date" %}: <xsl:value-of select="date" />
                                </div>
                                <div class="project-description">{% trans "Description" %}: <xsl:value-of
                                        select="description" />
                                </div>
                                <div class="project-tools">{% trans "Outils" %}: <xsl:value-of select="tools" />
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">{% trans "Cursus Scolaire" %}</div>
                        <xsl:for-each select="resume/education/degree">
                            <div class="degree">
                                <div class="degree-title">{% trans "Diplôme" %}: <xsl:value-of select="title" />
                                </div>
                                <div class="degree-institution">{% trans "Etablissement" %}: <xsl:value-of
                                        select="institution" />
                                </div>
                                <div class="degree-date">{% trans "Date" %}: <xsl:value-of select="date" />
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">{% trans "Langues" %}</div>
                        <xsl:for-each select="resume/languages/language">
                            <div class="language">
                                <div class="language-name">{% trans "Langue" %}: <xsl:value-of select="name" />
                                </div>
                                <div class="language-level">{% trans "Niveau" %}: <xsl:value-of select="level" />
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">{% trans "Compétences" %}</div>
                        <xsl:for-each select="resume/skills/category">
                            <div class="skill-category">
                                <div class="category-name">
                                    <xsl:value-of select="@name" />: </div>
                                <xsl:for-each select="skill">
                                    <div class="skill">
                                        <xsl:value-of select="." />
                                    </div>
                                </xsl:for-each>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">{% trans "Atouts" %}</div>
                        <xsl:for-each select="resume/attributes/attribute">
                            <div class="attribute">
                                <xsl:value-of select="." />
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">{% trans "Centres d'intérêt" %}</div>
                        <xsl:for-each select="resume/interests/interest">
                            <div class="interest">
                                <xsl:value-of select="." />
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="section">
                        <div class="section-title">{% trans "Liens utiles" %}</div>
                        <div id="link-section" >
                            <div class="link">
                                <a href="{resume/links/link[1]}" target="_blank">
                                    <img id="github-logo" src="/static/portfolio/img/github.svg" alt="{resume/links/link[1]}" />
                                </a>
                            </div>
                            <div class="link">
                                <a href="{resume/links/link[2]}" target="_blank">
                                    <img id="linkedIn-logo" src="/static/portfolio/img/linkedIn.svg" alt="{resume/links/link[2]}" />
                                </a>
                            </div>
                        </div>
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
                        var lang = element.getAttribute('data-lang');
                        document.documentElement.setAttribute('lang', lang);
                        // Store the selected language in a cookie
                        document.cookie = "selectedLanguage=" + encodeURIComponent(lang) + "; path=/";
                        document.cookie = "languageDisplay=" + encodeURIComponent(element.textContent) + "; path=/";
                    }
                
                    function changeLanguage(lang) {
                        document.getElementById('languageInput').value = lang;
                        document.getElementById('languageForm').submit();
                    }
                
                    // Function to get the value of a cookie
                    function getCookie(name) {
                        let cookieArr = document.cookie.split(";");
                        for (let i = 0; i &lt; cookieArr.length; i++) {
                            let cookiePair = cookieArr[i].split("=");
                            if (name == cookiePair[0].trim()) {
                                return decodeURIComponent(cookiePair[1]);
                            }
                        }
                        return null;
                    }
                
                    // On page load, update the button text with the value from the cookie
                    document.addEventListener("DOMContentLoaded", function() {
                        var selectedLanguage = getCookie("selectedLanguage");
                        if (selectedLanguage) {
                            var button = document.getElementById('dropdownMenuButton');
                            button.textContent = getCookie("languageDisplay");
                            console.log(selectedLanguage);
                            document.documentElement.setAttribute('lang', selectedLanguage);
                        }
                    });

                    document.addEventListener('DOMContentLoaded', function() {
                        document.getElementById('nextInput').value = window.location.pathname;
                    });
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>