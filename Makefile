CN=in77j

# export TEXINPUTS:=.:./texmf:~/texmf:${TEXINPUTS}
export TEXMFHOME:=.:./texmf:~/texmf:${TEXMFHOME}

TEXNAME=$(CN)
# TEXCOMM=xelatex -halt-on-error
TEXCOMM=pdflatex -halt-on-error
# PANDOC=$(HOME)/.cabal/bin/pandoc -f markdown --filter overlay_filter --slide-level=3

default: $(TEXNAME).pdf

clean:
	rm -f *.aux *.blg *.log *.toc *.lot *.lof *.bbl *.nav *.out *.snm *.vrb *.xdv tex/*.aux

reduce:
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH \
		-sOutputFile=$(TEXNAME)-reduc.pdf $(TEXNAME).pdf

compileLive:
	~/.local/bin/when-changed tex/1.*.md.tex tex/diagrams.tikz.tex $(TEXNAME).tex -c make
