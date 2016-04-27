BUILD = build
BOOKNAME = Genomics-easy-as-Pi
TITLE = title.txt
METADATA = metadata.xml
CHAPTERS = en/000-cover-photos.md en/000-dedication.md en/001-introduction.md en/002-genomics-primer.md en/003-big-data-processing-options.md en/004-cluster-computer-design.md en/005-software.md en/006-blockchain.md en/007-final-word.md
TOC = --toc --toc-depth=3
COVER_IMAGE = images/book_frontcover.jpeg
LATEX_CLASS = report

all: book

book: epub html pdf

clean:
	rm -r $(BUILD)

epub: $(BUILD)/epub/$(BOOKNAME).epub

html: $(BUILD)/html/$(BOOKNAME).html

pdf: $(BUILD)/pdf/$(BOOKNAME).pdf

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc $(TOC) -S --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) -o $@ $^

$(BUILD)/html/$(BOOKNAME).html: $(CHAPTERS)
	mkdir -p $(BUILD)/html
	pandoc $(TOC) --standalone --to=html5 -o $@ $^

$(BUILD)/pdf/$(BOOKNAME).pdf: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/pdf
	pandoc $(TOC) --latex-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $@ $^

.PHONY: all book clean epub html pdf
