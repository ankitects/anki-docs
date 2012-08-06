HTML := $(patsubst %.txt,%.html,$(wildcard *.txt))
CWD = $(shell pwd)
WEB = /Users/dae/Lib/web/ankisrs.net

all: $(HTML)
	rsync -av *.png *.html stylesheets $(WEB)/docs/dev
	make -C $(WEB)

%.html: %.txt asciidoc.conf stylesheets/xhtml11.css
	asciidoc -a stylesdir=$(CWD)/stylesheets $< 

clean:
	touch *.txt	
