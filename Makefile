# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
PAPER         =
BUILDDIR      = build

# Internal variables.
PAPEROPT_a4      = -D latex_paper_size=a4
PAPEROPT_letter  = -D latex_paper_size=letter
ALLSPHINXOPTS    = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)

.PHONY: help clean html dirhtml singlehtml pickle json htmlhelp qthelp devhelp epub latex latexpdf text man changes linkcheck doctest

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  dirhtml    to make HTML files named index.html in directories"
	@echo "  singlehtml to make a single large HTML file"
	@echo "  pickle     to make pickle files"
	@echo "  json       to make JSON files"
	@echo "  htmlhelp   to make HTML files and a HTML help project"
	@echo "  qthelp     to make HTML files and a qthelp project"
	@echo "  devhelp    to make HTML files and a Devhelp project"
	@echo "  epub       to make an epub"
	@echo "  latex      to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
	@echo "  latexpdf   to make LaTeX files and run them through pdflatex"
	@echo "  text       to make text files"
	@echo "  man        to make manual pages"
	@echo "  changes    to make an overview of all changed/added/deprecated items"
	@echo "  linkcheck  to check all external links for integrity"
	@echo "  doctest    to run all doctests embedded in the documentation (if enabled)"

clean:
	-rm -rf $(BUILDDIR)/*

html:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b html $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/html/$$VERSION ;\
	done
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html/VERSION."

dirhtml:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/dirhtml/$$VERSION ;\
	done
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/dirhtml/VERSION."

singlehtml:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/singlehtml/$$VERSION ;\
	done
	@echo
	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml/VERSION."

pickle:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/pickle/$$VERSION ;\
	done
	@echo
	@echo "Build finished; now you can process the pickle files."

json:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/pickle/$$VERSION ;\
	done
	@echo
	@echo "Build finished; now you can process the JSON files."

htmlhelp:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b htmlhelp $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/htmlhelp/$$VERSION ;\
	done
	@echo
	@echo "Build finished; now you can run HTML Help Workshop with the" \
	      ".hhp project file in $(BUILDDIR)/htmlhelp/VERSION."

qthelp:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b qthelp $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/qthelp/$$VERSION ;\
	done
	@echo
	@echo "Build finished; now you can run "qcollectiongenerator" with the" \
	      ".qhcp project file in $(BUILDDIR)/qthelp, like this:"
	@echo "# qcollectiongenerator $(BUILDDIR)/qthelp/wrpme.qhcp"
	@echo "To view the help file:"
	@echo "# assistant -collectionFile $(BUILDDIR)/qthelp/VERSION/wrpme.qhc"

devhelp:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b devhelp $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/devhelp/$$VERSION ;\
	done
	@echo
	@echo "Build finished."
	@echo "To view the help file:"
	@echo "# mkdir -p $$HOME/.local/share/devhelp/wrpme"
	@echo "# ln -s $(BUILDDIR)/devhelp/<VERSION>/ $$HOME/.local/share/devhelp/wrpme"
	@echo "# devhelp"

epub:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b epub $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/epub/$$VERSION ;\
	done
	@echo
	@echo "Build finished. The epub file is in $(BUILDDIR)/epub/VERSION."

latex:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/latex/$$VERSION ;\
	done
	@echo
	@echo "Build finished; the LaTeX files are in $(BUILDDIR)/latex."
	@echo "Run \`make' in that directory to run these through (pdf)latex" \
	      "(use \`make latexpdf' here to do that automatically)."

latexpdf:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/latex/$$VERSION ;\
	    echo "Running LaTeX files through pdflatex..." ;\
	    make -C $(BUILDDIR)/latex/$$VERSION all-pdf ;\
	done
	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex/VERSION."

text:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b text $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/text/$$VERSION ;\
	done
	@echo
	@echo "Build finished. The text files are in $(BUILDDIR)/text/VERSION."

man:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b man $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/man/$$VERSION ;\
	done
	@echo
	@echo "Build finished. The manual pages are in $(BUILDDIR)/man/VERSION."

changes:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/changes/$$VERSION ;\
	done
	@echo
	@echo "The overview file is in $(BUILDDIR)/changes/VERSION."

linkcheck:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/linkcheck/$$VERSION ;\
	done
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	      "or in $(BUILDDIR)/linkcheck/VERSION/output.txt."

doctest:
	for VERSION in `find source/* -maxdepth 0 -type d | cut -d "/" -f 2`; do \
	    $(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) source/$$VERSION $(BUILDDIR)/doctest/$$VERSION ;\
	done
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/VERSION/output.txt."
