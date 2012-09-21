HTML := $(patsubst %.txt,%.html,$(wildcard *.txt))
CWD = $(shell pwd)
WEB = /Users/dae/Lib/web/ankisrs.net

all: build
	rsync -av *.png *.html stylesheets $(WEB)/docs/dev
	rsync -av *.png *.html stylesheets $(WEB)/docs/
	make -C $(WEB)
	git commit -a -m update
	#git push

build: $(HTML)

%.html: %.txt asciidoc.conf stylesheets/xhtml11.css
	asciidoc -a stylesdir=$(CWD)/stylesheets $< 

clean:
	touch *.txt	
