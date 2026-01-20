from django.shortcuts import render
from django.http import HttpResponse
from django.conf import settings
from django.utils.translation import gettext as _
from lxml import etree
import os

# Create your views here.

def home(request):
    return render(request, 'home.html')

def video(request):
    return render(request, 'video.html')

def create_html_from_xslt():
    # Paths to your files
    xml_file_path = os.path.join('portfolio/templates/cv.xml')
    xslt_file_path = os.path.join('portfolio/static/portfolio/xslt/cv_style.xslt')

    # Load the XML and XSLT
    xml = etree.parse(xml_file_path)
    xslt = etree.parse(xslt_file_path)

    # Transform the XML with the XSLT
    transform = etree.XSLT(xslt)
    html_doc = transform(xml)
    
    # Prepare the HTML document with the DOCTYPE and lang attribute
    html_output = f'<!DOCTYPE html>\n{html_doc}'

    # Define the output HTML file path
    output_html_file_path = os.path.join('portfolio/templates', 'transformed_resume.html')

    # Write the transformed HTML to a file
    with open(output_html_file_path, 'w') as html_file:
        html_file.write(str(html_output))

    print("=============================================\n")
    print(f"HTML file created at {output_html_file_path}")
    print("=============================================\n")

def certificats(request):
    return render(request, 'certificats.html')


def render_resume(request):
    # create_html_from_xslt() # Uncomment this line to create the HTML file from the XSLT
    return render(request, 'transformed_resume.html')