<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
  <html>
    <head>
      <title>CV de <xsl:value-of select="cv/informations_personnelles/prenom"/> <xsl:value-of select="cv/informations_personnelles/nom"/></title>
    </head>
    <body>
      <h1>CV de <xsl:value-of select="cv/informations_personnelles/prenom"/> <xsl:value-of select="cv/informations_personnelles/nom"/></h1>
      <h2>Informations Personnelles</h2>
      <p><b>Email:</b> <xsl:value-of select="cv/informations_personnelles/contact/email"/></p>
      <p><b>Téléphone:</b> <xsl:value-of select="cv/informations_personnelles/contact/telephone"/></p>
      
      <h2>Expérience Professionnelle</h2>
      <xsl:for-each select="cv/experience_professionnelle/emploi">
        <div>
          <h3><xsl:value-of select="titre"/></h3>
          <p><b>Entreprise:</b> <xsl:value-of select="entreprise"/> - <xsl:value-of select="ville"/>, <xsl:value-of select="pays"/></p>
          <p><b>Période:</b> <xsl:value-of select="date_debut"/> à <xsl:value-of select="date_fin"/></p>
          <p><b>Description:</b> <xsl:value-of select="description"/></p>
        </div>
      </xsl:for-each>
      
      <h2>Formation</h2>
      <xsl:for-each select="cv/formation/diplome">
        <div>
          <h3><xsl:value-of select="niveau"/> en <xsl:value-of select="specialite"/></h3>
          <p><b>Institution:</b> <xsl:value-of select="institution"/> - <xsl:value-of select="ville"/>, <xsl:value-of select="pays"/></p>
          <p><b>Date d'obtention:</b> <xsl:value-of select="date_obtention"/></p>
        </div>
      </xsl:for-each>
      
      <h2>Compétences</h2>
      <h3>Techniques</h3>
      <ul>
        <xsl:for-each select="cv/competences/technique/competence">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
      <h3>Linguistiques</h3>
      <ul>
        <xsl:for-each select="cv/competences/linguistique/langue">
          <li><xsl:value-of select="."/> (<xsl:value-of select="following-sibling::niveau"/>)</li>
        </xsl:for-each>
      </ul>
      
      <h2>Intérêts</h2>
      <ul>
        <xsl:for-each select="cv/interets/interet">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>