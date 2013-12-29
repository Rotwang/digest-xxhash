.PHONY: all regression ut panda-install clean

ifndef V
    MAKEFLAGS += -s
endif

MODULE_ROOT := $(abspath $(dir $(firstword $(MAKEFILE_LIST))))
build-dir := build

say       := echo
separator := =====
say-sep   := $(say) "$(separator)"

all: regression
regression: ut
ut:
	$(say-sep)
	$(say) "Running UT"
	prove -v -e "perl6 -Ilib"

panda-install:
	mkdir -p $(build-dir)
	cd $(build-dir) && \
		cmake -DINC_ROOT=$(MODULE_ROOT)/lib ../src/
	$(MAKE) -C $(build-dir) install

clean:
	$(RM) -r $(build-dir) $(MODULE_ROOT)/lib
