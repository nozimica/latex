################################################################################
### Parameters:

# export TEXINPUTS:=.:./texmf:~/texmf:${TEXINPUTS}
export TEXMFHOME:=.:./texmf:~/texmf:${TEXMFHOME}

TEXNAME=presentacion
TEXCOMM=xelatex -halt-on-error
#TEXCOMM=pdflatex -halt-on-error
PANDOC=$(HOME)/.cabal/bin/pandoc -f markdown -t beamer --filter overlay_filter --slide-level=3

MD_INFILES := $(wildcard tex/*.md.tex)
MD_OUTFILES := $(MD_INFILES:.md.tex=.tex)

################################################################################
### Rules:

default: $(TEXNAME).pdf

%.tex: %.md.tex
	$(PANDOC) $? -o $@

$(TEXNAME).pdf: $(TEXNAME).tex $(MD_OUTFILES) nozbeamer.sty
	# biber $(TEXNAME) --output_format bibtex
	$(TEXCOMM) -no-pdf $(TEXNAME).tex && rm -f $(TEXNAME).xdv
	# bibtex $(TEXNAME)
	$(TEXCOMM) -interaction=batchmode $(TEXNAME).tex
	# $(TEXCOMM) $(TEXNAME).tex

clean:
	rm -f *.aux *.blg *.log *.toc *.lot *.lof *.bbl *.nav *.out *.snm *.vrb *.xdv tex/*.aux $(MD_OUTFILES)

complete: clean
	$(TEXCOMM) $(TEXNAME).tex
	$(TEXCOMM) $(TEXNAME).tex

handout:
	cp -f $(TEXNAME).tex $(TEXNAME)-handout.tex
	sed -i 's:documentclass\[\(.*\)\]{beamer}:documentclass[\1,handout]{beamer}:' $(TEXNAME)-handout.tex
	$(TEXCOMM) $(TEXNAME)-handout.tex
	$(TEXCOMM) $(TEXNAME)-handout.tex
	$(TEXCOMM) $(TEXNAME)-handout.tex
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH \
		-sOutputFile=$(TEXNAME)-handout-reduc.pdf $(TEXNAME)-handout.pdf
	#mv -f $(TEXNAME)-handout-reduc.pdf $(TEXNAME)-handout.pdf

reduce:
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH \
		-sOutputFile=$(TEXNAME)-reduc.pdf $(TEXNAME).pdf

compileLive:
	~/.local/bin/when-changed tex/1.*.md.tex tex/diagrams.tikz.tex $(TEXNAME).tex -c make

getOldPgf:
	mkdir -p texmf/tex
	rm -rf tmptikz && mkdir -p tmptikz
	wget -P tmptikz ftp://tug.org/historic/systems/texlive/2013/tlnet-final/archive/pgf.tar.xz
	tar Jxf tmptikz/pgf.tar.xz --directory tmptikz
	mv tmptikz/tex/* texmf/tex
	rm -rf tmptikz
