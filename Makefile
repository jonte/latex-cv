VER=$(shell a=`git tag --points-at HEAD | head -n 1`; if [ -z "$$a" ]; then git rev-parse --short HEAD; else echo $$a; fi )
PACKAGES=texlive-fonts-recommended     \
         texlive-latex-extra           \
         texlive-fonts-extra           \
         dvipng                        \
         texlive-latex-recommended


LATEX=pdflatex

.PHONY: install_dependencies clean all release

all: jonatan-cv.pdf example-cv.pdf

jonatan-cv.pdf: jonatan-cv.tex twocolcv.cls
	$(LATEX) jonatan-cv.tex

example-cv.pdf: example-cv.tex twocolcv.cls
	$(LATEX) example-cv.tex

install_dependencies:
	sudo apt-get update
	sudo apt-get install -y --no-install-recommends $(PACKAGES)

clean:
	rm -f *.aux *.log *.out *.pdf release/*.pdf

release: jonatan-cv.pdf example-cv.pdf
	mkdir -p release/
	cp jonatan-cv.pdf release/jonatan-cv-$(VER).pdf
	cp example-cv.pdf release/example-cv-$(VER).pdf
