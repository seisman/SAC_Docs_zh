FIGURE = ../images/
PDF = $(patsubst %.sh, $(FIGURE)/%.pdf, $(wildcard *.sh))

all: $(PDF) install

$(FIGURE)/%.pdf: %.sh
	sh $<

install:
	-mv *.pdf $(FIGURE)/
	-mv *.png $(FIGURE)/
