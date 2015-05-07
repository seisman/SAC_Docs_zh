FIGURE = ../figures
PDF = $(addsuffix .pdf, $(basename $(wildcard *.sh)))

all: get $(PDF) install

get:
	sh GetData.wget

%.pdf: %.sh
	sh $<

install:
	mv $(PDF) ${FIGURE}
