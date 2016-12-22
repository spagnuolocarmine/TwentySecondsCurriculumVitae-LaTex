# Makefile twentyseconds cv

files_tex = $(wildcard *.tex)
all: pdf
	@echo "Done!"
pdf: *.tex
	@echo "Building.... $^"
	@$(foreach var,$(files_tex),pdflatex -interaction=nonstopmode '$(var)' 1>/dev/null;)
	@$(foreach var,$(files_tex),convert -density 150 -trim -quality 100 -flatten -sharpen 0x1.0 '$(var:.tex=.pdf)' '$(var:.tex=.jpg)';)
clean:
	@rm -f *.aux *.dvi *.log *.out *.bak
	@echo "Clean done.";
