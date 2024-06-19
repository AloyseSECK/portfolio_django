from django.shortcuts import render
from django.http import HttpResponse
from django.conf import settings
from django.utils.translation import gettext as _
from lxml import etree
import os

# Create your views here.

def home(request):
    return render(request, 'home.html')
 
def render_html(request):
    # Chemin vers vos fichiers
    xml_file_path = os.path.join('portfolio/templates/cv.xml')
    xslt_file_path = os.path.join('portfolio/static/portfolio/xslt/cv_style.xslt')

    # Charger le XML et le XSLT
    xml = etree.parse(xml_file_path)
    xslt = etree.parse(xslt_file_path)

    # Transformer le XML avec le XSLT
    transform = etree.XSLT(xslt)
    html_doc = transform(xml)
    
    # Préparer le document HTML avec le DOCTYPE et l'attribut lang
    html_output = f'<!DOCTYPE html>\n{html_doc}'

    # Renvoyer le résultat transformé
    return HttpResponse(html_output, content_type='text/html')

def render_resume(request):
    lang = request.GET.get('lang', 'en')  # Récupérer le paramètre de langue avec 'en' par défaut

    # Charger le fichier XML
    xml_file_path = os.path.join('portfolio/templates/translated_cv.xml')
    xml_doc = etree.parse(xml_file_path)

    # Charger le fichier XSLT
    xslt_file_path = os.path.join('portfolio/static/portfolio/xslt/cv_style.xslt')
    xslt_doc = etree.parse(xslt_file_path)
    
    # Appliquer la transformation XSLT
    transform = etree.XSLT(xslt_doc)
    result_tree = transform(xml_doc, lang=etree.XSLT.strparam(lang))

    # Convertir le résultat en chaîne de caractères
    result_str = etree.tostring(result_tree, pretty_print=True, encoding='UTF-8', method="html")

    return HttpResponse(result_str, content_type='text/html')