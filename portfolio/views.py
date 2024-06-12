from django.shortcuts import render
from django.http import HttpResponse
from django.conf import settings
import os
from lxml import etree

# Create your views here.

def home(request):
    return render(request, 'home.html')
 

def render_html(request):
    # Chemin vers vos fichiers
    xml_file_path = os.path.join('portfolio/templates/cv.xml')
    xslt_file_path = os.path.join('portfolio/templates/cv_style.xslt')

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

# def render_xml(request):
#     # Chemin vers vos fichiers
#     xml_file_path = os.path.join('portfolio/templates/cv.xml')

#     # Charger le XML
#     # xml = etree.parse(xml_file_path)
#     with open(xml_file_path, 'rb') as f:
#         xml_content = f.read()

#     # Renvoyer le XML
#     return HttpResponse(xml_content, content_type='text/xml')