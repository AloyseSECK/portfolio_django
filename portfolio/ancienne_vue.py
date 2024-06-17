import os
from lxml import etree
from django.shortcuts import render
from django.template.loader import render_to_string
from django.http import HttpResponse
from django.conf import settings

# Create your views here.

def home(request):
    return render(request, 'home.html')
 

# def render_html(request):
#     # Chemin vers vos fichiers
#     xml_file_path = os.path.join('portfolio/templates/cv.xml')
#     xslt_file_path = os.path.join('portfolio/static/portfolio/xslt/cv_style.xslt')

#     # Charger le XML et le XSLT
#     xml = etree.parse(xml_file_path)
#     xslt = etree.parse(xslt_file_path)

#     # Transformer le XML avec le XSLT
#     transform = etree.XSLT(xslt)
#     html_doc = transform(xml)
    
#     # Préparer le document HTML avec le DOCTYPE et l'attribut lang
#     html_output = f'<!DOCTYPE html>\n{html_doc}'

#     # Renvoyer le résultat transformé
#     return HttpResponse(html_output, content_type='text/html')
# def render_html(request):
#     # Chemin vers vos fichiers
#     xml_file_path = os.path.join('portfolio/templates/cv.xml')
#     xslt_file_path = os.path.join('portfolio/static/portfolio/xslt/cv_style.xslt')

#     # Charger le XML
#     xml = etree.parse(xml_file_path)

#     # Rendre le XSLT en tant que chaîne de caractères en utilisant render_to_string
#     xslt_content = render_to_string(xslt_file_path)

#     # Parser le XSLT à partir de la chaîne de caractères
#     xslt = etree.XML(xslt_content)

#     # Transformer le XML avec le XSLT
#     transform = etree.XSLT(xslt)
#     html_doc = transform(xml)

#     # Préparer le document HTML avec le DOCTYPE et l'attribut lang
#     html_output = f'<!DOCTYPE html>\n{html_doc}'

#     # Renvoyer le résultat transformé
#     return HttpResponse(html_output, content_type='text/html')

# def generate_html_from_xml_and_xslt():
#     # File paths
#     xml_file_path = os.path.join(settings.BASE_DIR, 'portfolio/templates/cv.xml')
#     xslt_file_path = os.path.join(settings.BASE_DIR, 'portfolio/static/portfolio/xslt/cv_style.xslt')
#     output_html_file_path = os.path.join(settings.BASE_DIR, 'portfolio/templates/cv.html')

#     try:
#         # Load XML and XSLT files
#         xml = etree.parse(xml_file_path)
#         xslt = etree.parse(xslt_file_path)

#         # Transform XML with XSLT
#         transform = etree.XSLT(xslt)
#         html_doc = transform(xml)

#         # Prepare HTML content
#         html_output = f'<!DOCTYPE html>\n{html_doc}'

#         # Write HTML content to a file
#         with open(output_html_file_path, 'w', encoding='utf-8') as html_file:
#             html_file.write(html_output)

#         print(f'Successfully generated HTML file: {output_html_file_path}')

#     except FileNotFoundError as e:
#         print(f'Error: {e}')

#     except Exception as e:
#         print(f'Error: Failed to generate HTML - {e}')

# def render_html(request):
#     # Generate HTML from XML and XSLT
#     generate_html_from_xml_and_xslt()

#     # Return the generated HTML
#     return render(request, 'cv.html')

# # def render_html2(request):
# #     # Return the generated HTML
# #     return render(request, 'generated_cv.html')
