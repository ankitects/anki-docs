HTML := $(patsubst %.txt,%.html,$(wildcard *.txt))
CWD = $(shell pwd)
WEB = /Users/dae/Lib/web/ankisrs.net
AMHELP = ../mob/AnkiMobile/Resources/HTML/help.html

all: build
	-git commit -a -m update
	git pull soren master
	perl -i -pe 's/font-size: 1em;/font-size: 2em;/g' am-upgrade.html
	rsync -a *.png *.html stylesheets $(WEB)/docs/dev
	rsync -a *.png *.html stylesheets $(WEB)/docs/
	rsync -a am-manual.html $(AMHELP)
	perl -i -pe 's/(padding-.*?: )2em/$${1}0.5em/g' $(AMHELP)
	make -C $(WEB)
	#git push

build: $(HTML)

%.html: %.txt asciidoc.conf stylesheets/xhtml11.css
	asciidoc -a stylesdir=$(CWD)/stylesheets $< 

clean:
	touch *.txt	
