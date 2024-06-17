<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html lang="fr">
      <head>
        <title>CV de <xsl:value-of select="cv/informations_personnelles/prenom" /><xsl:text> </xsl:text><xsl:value-of
            select="cv/informations_personnelles/nom" /></title>
        <link rel="stylesheet" type="text/css" href="/static/portfolio/css/cv_style.css" />
        <link rel="stylesheet" type="text/css" href="/static/portfolio/css/home_style.css" />
        <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Castoro:wght@400;700&amp;display=swap"
          rel="stylesheet" />
      </head>
      <body>
        <xsl:copy-of select="document('../../../templates/header.html')/*" />
        <main class="CV">
          <h1>CV de <xsl:value-of select="cv/informations_personnelles/prenom" /> <xsl:value-of
              select="cv/informations_personnelles/nom" /></h1>
          <h2>Informations Personnelles</h2>
          <p class="email">Email: <xsl:value-of select="cv/informations_personnelles/contact/email" /></p>
          <p class="telephone">Téléphone: <xsl:value-of
              select="cv/informations_personnelles/contact/telephone" /></p>

          <h2>Expérience Professionnelle</h2>
          <xsl:for-each select="cv/experience_professionnelle/emploi">
            <div class="emploi">
              <h3>
                <xsl:value-of select="titre" />
              </h3>
              <p class="entreprise">Entreprise: <xsl:value-of select="entreprise" /> - <xsl:value-of
                  select="ville" />, <xsl:value-of select="pays" /></p>
              <p class="periode">Période: <xsl:value-of select="date_debut" /> à <xsl:value-of
                  select="date_fin" /></p>
              <p class="description">Description: <xsl:value-of select="description" /></p>
            </div>
          </xsl:for-each>

          <h2>Formation</h2>
          <xsl:for-each select="cv/formation/diplome">
            <div class="diplome">
              <h3><xsl:value-of select="niveau" /> en <xsl:value-of select="specialite" /></h3>
              <p class="institution">Institution: <xsl:value-of select="institution" /> - <xsl:value-of
                  select="ville" />, <xsl:value-of select="pays" /></p>
              <p class="date_obtention">Date d'obtention: <xsl:value-of select="date_obtention" /></p>
            </div>
          </xsl:for-each>

          <h2>Compétences</h2>
          <h3>Techniques</h3>
          <ul class="competences-techniques">
            <xsl:for-each select="cv/competences/technique/competence">
              <li>
                <xsl:value-of select="." />
              </li>
            </xsl:for-each>
          </ul>
          <h3>Linguistiques</h3>
          <ul class="competences-linguistiques">
            <xsl:for-each select="cv/competences/linguistique/langue">
              <li><xsl:value-of select="." /> (<xsl:value-of select="following-sibling::niveau" />)</li>
            </xsl:for-each>
          </ul>

          <h2>Intérêts</h2>
          <ul class="interets">
            <xsl:for-each select="cv/interets/interet">
              <li>
                <xsl:value-of select="." />
              </li>
            </xsl:for-each>
          </ul>
        </main>
        <xsl:copy-of select="document('../../../templates/footer.html')/*" />
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