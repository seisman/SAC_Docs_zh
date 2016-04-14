FIGURE = ../figures
PDF = $(patsubst %.sh, $(FIGURE)/%.pdf, $(wildcard *.sh))

all: $(PDF) install

$(FIGURE)/%.pdf: %.sh
	sh $<

install:
	-mv *.pdf $(FIGURE)/
