BUILD_DIR = build
BOOK_FILE_NAME = Genomics-easy-as-Pi
TITLE = title.txt
METADATA = metadata.xml

CHAPTERS = \
00-Dedication.md \
01-RPiCluster.md  \
02-Introduction.md \
03-Genomics.md \
04-Big-data.md \
05-Pi-cluster.md \
06-Software.md \
07-Blockchain.md \
08-Final-word.md


TOC = --toc --toc-depth=3
COVER_IMAGE = ../images/book_frontcover.jpeg
LATEX_CLASS = report

all: book

book: epub 

clean:
	rm -r $(BUILD)

epub: $(BUILD_DIR)/epub/$(BOOK_FILE_NAME).epub

 

$(BUILD_DIR)/epub/$(BOOK_FILE_NAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD_DIR)/epub
	pandoc $(TOC) -S --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) -o $@ $^

 

.PHONY: all book clean epub 


