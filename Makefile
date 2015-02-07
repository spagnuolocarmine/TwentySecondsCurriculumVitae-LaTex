# Makefile twentyseconds cv

files_tex = $(wildcard *.tex)
cv_name = "Twenty-Seconds_cv"
all: pdf
	@echo "Done!"
pdf: *.tex
	@echo "Building.... $^"
	@$(foreach var,$(files_tex),pdflatex -interaction=nonstopmode -jobname=$(cv_name) '$(var)' 1>/dev/null;)
clean:
	@rm -f *.aux *.dvi *.log *.out *.pdf *.bak
	@echo "Clean done.";
