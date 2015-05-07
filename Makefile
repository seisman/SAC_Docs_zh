#
# Makefile for LaTeX project SAC_Docs_zh
#
# Reference:
# 	1. http://tex.stackexchange.com/questions/40738/
# 	2. Manual of latexmk
#

.PHONY: SAC_Docs.pdf all clean

all: SAC_Docs.pdf

SAC_Docs.pdf: SAC_Docs.tex
	latexmk -xelatex -shell-escape -use-make $^

clean:
	latexmk -c
	-rm -r _minted-SAC_Docs
