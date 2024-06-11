from django.shortcuts import render
from django.http import HttpResponse
from django.conf import settings
import os
from lxml import etree

# Create your views here.

def home(request):
    return render(request, 'home.html')


# def my_xml_view(request):
#     items = Item.objects.all()
#     return render(request, 'my_template.xml', {'items': items}, content_type='application/xml')


def render_xml(request):
    # Chemin vers votre fichier XML
    xml_file_path = os.path.join(settings.BASE_DIR, 'portfolio/templates/cv.xml')
    
    with open(xml_file_path, 'r') as xml_file:
        xml_content = xml_file.read()
    
    # Renvoie le contenu XML avec le type MIME approprié
    return HttpResponse(xml_content, content_type='application/xml')


def render_styled_cv(request):
    # Chemin vers vos fichiers
    xml_file_path = os.path.join('portfolio/templates/cv.xml')
    xslt_file_path = os.path.join('portfolio/templates/cv_style.xslt')

    # Charger le XML et le XSLT
    xml = etree.parse(xml_file_path)
    xslt = etree.parse(xslt_file_path)

    # Transformer le XML avec le XSLT
    transform = etree.XSLT(xslt)
    html_doc = transform(xml)

    # Renvoyer le résultat transformé
    return HttpResponse(str(html_doc), content_type='text/html')    