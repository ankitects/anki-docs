MAKO := $(patsubst %.txt,%.mako,$(wildcard *.txt))
CWD = $(shell pwd)
WEB = /Users/dae/Lib/web/ankisrs.net
AMHELP = ../mob/AnkiMobile/Resources/HTML/help.html
TOC_FILES = manual.mako am-manual.mako changes.mako addons.mako \
    am-changes.mako

all: save build
	#perl -i -pe 's/font-size: 1em;/font-size: 2em;/g' am-upgrade.html
	rsync -a img $(WEB)/docs/
	rsync -a $(WEB)/docs/am-manual.html $(AMHELP)
	#perl -i -pe 's/(padding-.*?: )2em/$${1}0.5em/g' $(AMHELP)
	make -C $(WEB)

save:
	-git commit -a -m update && git push
	git pull --no-edit soren master

build: $(MAKO)
	@echo building mako
	@rsync -a *.mako $(WEB)/docs/
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
