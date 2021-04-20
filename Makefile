# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXBUILD   = sphinx-build
SPHINXOPTS    = -j auto
SOURCEDIR     = source
BUILDDIR      = build
DOCNAME       = SAC_Docs
HTML          = dirhtml
LATEXPDF      = latexpdf

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile build build_html build_pdf server watch

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

build: build_html build_pdf

build_html: $(HTML)

build_pdf: $(LATEXPDF}
    @echo
	@echo "Copy built PDF to HTML directory"
	@echo
	cp $(BUILDDIR)/latex/$(DOCNAME).pdf $(BUILDDIR)/$(HTML)/

server: $(HTML)
    @echo
	@echo "Running a server on port 8009"
	@echo "Open http://localhost:8009 in a web browser to preview the documentation"
	@echo
	cd $(BUILDDIR)/$(HTML) && python -m http.server 8009

# Watch a Sphinx directory and rebuild the documentation when a change is detected.
# See https://github.com/GaretJax/sphinx-autobuild for details
watch:
	sphinx-autobuild --open-browser --delay 1 -b ${HTML} ${SPHINXOPTS} $(SOURCEDIR) $(BUILDDIR)/${HTML}
