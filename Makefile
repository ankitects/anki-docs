MAKO := $(patsubst %.txt,%.mako,$(wildcard *.txt))
CWD = $(shell pwd)
WEB = $w/
AMHELP = ../mob/AnkiMobile/Resources/HTML/help.html
TOC_FILES = manual.mako am-manual.mako changes.mako addons.mako \
    am-changes.mako manual.fr.mako manual.pl.mako manual.es.mako

all: save build
	rsync -a img $(WEB)/docs/
	make -C $(WEB)

save:
	-git commit -a -m update && git push
	git pull --no-edit soren master
	git push

build: $(MAKO)
	@echo building mako
	@rsync -a *.mako $(WEB)/docs/
	@rsync -a *.png $(WEB)/docs/
	@make -C $(WEB) build

$(TOC_FILES): TOC := 1

%.mako: %.txt asciidoc.conf
	@echo asciidoc $<
	@asciidoc -s -b html5 -o $@ $<
	@echo '<%inherit file="/base.inc"/>' > $@.tmp
	@if [ x$(TOC) != x ]; then cat toc.pre >> $@.tmp; fi
	@cat $@ >> $@.tmp
	@if [ x$(TOC) != x ]; then cat toc.post >> $@.tmp; fi
	@mv $@.tmp $@

clean:
	touch *.txt	
