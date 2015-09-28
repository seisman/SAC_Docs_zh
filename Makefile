#
#  
#
# Reference:
# 	1. http://tex.stackexchange.com/questions/40738/
# 	2. Manual of latexmk
#
DOC = SAC_Docs

.PHONY: $(DOC).pdf all upload clean

all: $(DOC).pdf

$(DOC).pdf: $(DOC).tex
	latexmk -xelatex -shell-escape $^

upload:
	lftp dongzhi@home.ustc.edu.cn -e "put -O /public_html $(DOC).pdf; quit"

clean:
	latexmk -c
	-rm -r _minted-$(DOC) *.minted* *.pyg
