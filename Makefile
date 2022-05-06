DOCS_LIST := $(shell find . -name "docs.py")
DOCS_TARGETS := $(addsuffix .docs,$(DOCS_LIST))

docs: $(DOCS_TARGETS)
%.docs:
	./scripts/docs.sh $@

docs-all: docs
	./scripts/merge-docs.sh

