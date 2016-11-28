TEXNAME=carta

.PHONY=reduce show edit compileLive texdiff

# TEXCOMM=xelatex -halt-on-error
TEXCOMM=pdflatex
BIBTEX=bibtex

export TEXMFHOME:=.:./texmf:~/texmf:${TEXMFHOME}

default: $(TEXNAME).pdf

$(TEXNAME).pdf: clean $(TEXNAME).tex
	$(TEXCOMM) -halt-on-error -no-pdf $(TEXNAME).tex && rm -f $(TEXNAME).xdv
	$(TEXCOMM) -interaction=batchmode $(TEXNAME).tex
	# $(BIBTEX) $(TEXNAME)
	# $(TEXCOMM) -interaction=batchmode $(TEXNAME).tex
	# $(TEXCOMM) -interaction=batchmode $(TEXNAME).tex

clean:
	rm -f *.aux *.blg *.log *.toc *.lot *.lof *.bbl *.nav *.out *.snm *.vrb *.xdv

complete: clean $(TEXNAME).pdf

reduce:
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH \
		-sOutputFile=$(TEXNAME)-reduc.pdf $(TEXNAME).pdf

compileLive:
	~/.local/bin/when-changed $(TEXNAME).tex -c make

show:
	@atril $(TEXNAME).pdf &

edit: show compileLive
