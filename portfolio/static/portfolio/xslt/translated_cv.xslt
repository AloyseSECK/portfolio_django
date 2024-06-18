<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Définir un paramètre pour la sélection de la langue -->
  <xsl:param name="lang" select="'en'"/>

  <!-- Template pour l'élément root resume -->
  <xsl:template match="resume">
    <html>
      <head>
        <title>Resume - <xsl:value-of select="//title/*[name()=$lang]"/></title>
        <link rel="stylesheet" type="text/css" href="cv_style.css"/>
      </head>
      <body>
        <xsl:copy-of select="document('../../../templates/header.html')/*" /> <!-- HEADER -->

        <h1><xsl:value-of select="//fullname/*[name()=$lang]"/></h1>
        <h2><xsl:value-of select="//title/*[name()=$lang]"/></h2>

        <div class="contact">
          <h3>Contact Information</h3>
          <p>Phone: <xsl:value-of select="//phone"/></p>
          <p>Email: <xsl:value-of select="//email"/></p>
          <p>Location: <xsl:value-of select="//location/*[name()=$lang]"/></p>
        </div>

        <div class="availability">
          <h3>Availability</h3>
          <p><xsl:value-of select="//availability/*[name()=$lang]"/></p>
        </div>

        <div class="objective">
          <h3>Objective</h3>
          <p><xsl:value-of select="//objective/*[name()=$lang]"/></p>
          <p><xsl:value-of select="//objective/duration/*[name()=$lang]"/></p>
        </div>

        <div class="projects">
          <h3>Projects</h3>
          <xsl:for-each select="//project">
            <div class="project">
              <h4><xsl:value-of select="title/*[name()=$lang]"/></h4>
              <p>Institution: <xsl:value-of select="institution/*[name()=$lang]"/></p>
              <p>Date: <xsl:value-of select="date/*[name()=$lang]"/></p>
              <p>Description: <xsl:value-of select="description/*[name()=$lang]"/></p>
              <p>Tools: <xsl:value-of select="tools"/></p>
            </div>
          </xsl:for-each>
        </div>

        <div class="education">
          <h3>Education</h3>
          <xsl:for-each select="//degree">
            <div class="degree">
              <h4><xsl:value-of select="title/*[name()=$lang]"/></h4>
              <p>Institution: <xsl:value-of select="institution/*[name()=$lang]"/></p>
              <p>Date: <xsl:value-of select="date/*[name()=$lang]"/></p>
            </div>
          </xsl:for-each>
        </div>

        <div class="languages">
          <h3>Languages</h3>
          <xsl:for-each select="//language">
            <div class="language">
              <p><xsl:value-of select="name"/>: <xsl:value-of select="level/*[name()=$lang]"/></p>
            </div>
          </xsl:for-each>
        </div>

        <div class="technicalSkills">
          <h3>Technical Skills</h3>
          <xsl:for-each select="//skill">
            <div class="skill">
              <h4><xsl:value-of select="title/*[name()=$lang]"/></h4>
              <p><xsl:value-of select="description/*[name()=$lang]"/></p>
            </div>
          </xsl:for-each>
        </div>

        <div class="interests">
          <h3>Interests</h3>
          <xsl:for-each select="//interest">
            <p><xsl:value-of select="*[name()=$lang]"/></p>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
