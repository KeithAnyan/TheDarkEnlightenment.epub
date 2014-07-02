
all: TheDarkEnlightenment.epub TheDarkEnlightenment.mobi TheDarkEnlightenment.pdf TheDarkEnlightenment.md

TheDarkEnlightenment.epub:
	rm -f TheDarkEnlightenment.epub
	zip -X0 TheDarkEnlightenment.epub mimetype
	zip -Xur9D TheDarkEnlightenment.epub META-INF/* OEBPS/*

TheDarkEnlightenment.mobi: TheDarkEnlightenment.epub
	rm -f TheDarkEnlightenment.mobi
	ebook-convert TheDarkEnlightenment.epub TheDarkEnlightenment.mobi

TheDarkEnlightenment.pdf: TheDarkEnlightenment.epub
	rm -f TheDarkEnlightenment.pdf
	ebook-convert TheDarkEnlightenment.epub TheDarkEnlightenment.pdf --embed-all-fonts --margin-left 24 --margin-top 24 --margin-right 24 --margin-bottom 24 --minimum-line-height 160

TheDarkEnlightenment.md: TheDarkEnlightenment.epub
	rm -f TheDarkEnlightenment.md
	ebook-convert TheDarkEnlightenment.epub TheDarkEnlightenment.txt --txt-output-formatting=markdown --keep-links --keep-image-references
	cp -f TheDarkEnlightenment.txt TheDarkEnlightenment.md
	rm -f TheDarkEnlightenment.txt
