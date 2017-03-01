LATEXFLAGS?=-interaction=nonstopmode -file-line-error
PDFLATEX=pdflatex
BIBTEX=bibtex

JOB=lenguaje-matematico
TEXS=$(wildcard *.tex) $(wildcard *.sty) $(wildcard *.cls)
PICS=$(wildcard *.png) $(filter-out $(JOB).pdf,$(wildcard *.pdf)) $(wildcard *.jpg)
BIBS=$(wildcard *.bib) $(wildcard *.bst)

.DEFAULT: all
.PHONY: all clean

all: $(JOB).pdf

$(JOB).aux: | $(TEXS) $(PICS)
	$(PDFLATEX) $(LATEXFLAGS) $(JOB)

$(JOB).pdf: $(TEXS) $(PICS) $(JOB).aux $(JOB).bbl
	$(PDFLATEX) $(LATEXFLAGS) $(JOB)
