SRC_DIR := src
OUT_DIR := out
SOURCES := $(wildcard $(SRC_DIR)/*.txt)
OUTPUTS := $(patsubst $(SRC_DIR)/%.txt,$(OUT_DIR)/%.txt,$(SOURCES))

.PHONY: all build clean ci help count

all: build

build: $(OUTPUTS)

$(OUT_DIR)/%.txt: $(SRC_DIR)/%.txt
	@mkdir -p $(OUT_DIR)
	@cp $< $@

clean:
	@rm -rf $(OUT_DIR)

ci: clean build
	@echo "Checking build output..."
	@test -n "$(OUTPUTS)"
	@for file in $(OUTPUTS); do test -f "$$file" || exit 1; done
	@echo "TEST PASSED"

help:
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | sed 's/:.*##/: /'

count: build ## report source files and built words
	@ls -1 $(SRC_DIR)/*.txt | wc -l
	@wc -w $(OUTPUTS) | tail -1
# count: see section 5 of the README
# OUTPUTS is set by the wildcard above
