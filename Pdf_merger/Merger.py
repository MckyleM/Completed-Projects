import PyPDF2
import sys
import os
path = "./Draft_pdf"
outpath = "./Final_pdf"
merger = PyPDF2.PdfMerger()
for file in os.listdir(os.curdir):
    if file.endswith(".pdf"):
        
        merger.append(file)

    merger.write("Merged.pdf")