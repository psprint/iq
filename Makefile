NAME=iq

INSTALL?=install -c
PREFIX?=$(HOME)/.local
BIN_DIR?=$(DESTDIR)$(PREFIX)/bin
SHARE_DIR?=$(DESTDIR)$(PREFIX)/share/$(NAME)
DOC_DIR?=$(DESTDIR)$(PREFIX)/share/doc/$(NAME)
XDG_CONFIG_HOME?=$(HOME)/.config

all:

install:
	$(INSTALL) -d $(SHARE_DIR)
	$(INSTALL) -d $(XDG_CONFIG_HOME)/.config
	$(INSTALL) -d $(XDG_CONFIG_HOME)/.config/$(NAME)
	$(INSTALL) -d $(DOC_DIR)
	cp -vf bin/iq $(BIN_DIR)
	cp README.md NEWS LICENSE $(DOC_DIR)
	@if [ true = "`git rev-parse --is-inside-work-tree 2>/dev/null`" ]; then \
		git rev-parse HEAD; \
	else \
		cat .revision-hash; \
	fi > $(SHARE_DIR)/.revision-hash
	for fname in functions/*[^~]; do cp -vf "$$fname" $(SHARE_DIR); done

uninstall:
	rm -f $(SHARE_DIR)/.revision-hash $(SHARE_DIR)/_* $(SHARE_DIR)/* 
	[ -d $(SHARE_DIR) ] && rmdir $(SHARE_DIR) || true
	rm -f $(DOC_DIR)/README.md $(DOC_DIR)/LICENSE $(DOC_DIR)/NEWS
	[ -d $(DOC_DIR) ] && rmdir $(DOC_DIR) || true

.PHONY: all install uninstall
