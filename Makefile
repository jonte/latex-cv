PACKAGES=texlive-fonts-recommended     \
         texlive-latex-extra           \
         texlive-fonts-extra           \
         dvipng                        \
         texlive-latex-recommended     \
         latex-xcolor


LATEX=pdflatex

.PHONY: install_dependencies clean

all: jonatan example

jonatan:
	$(LATEX) jonatan-cv.tex

example:
	$(LATEX) example-cv.tex

install_dependencies:
	sudo apt-get update
	sudo apt-get install -y --no-install-recommends $(PACKAGES)

clean:
	rm *.aux *.log *.out *.pdf
