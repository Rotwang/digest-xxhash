.PHONY: all regression ut panda-install clean
.DELETE_ON_ERROR:

ifndef V
    MAKEFLAGS += -s
endif

MODULE_ROOT := $(abspath $(dir $(firstword $(MAKEFILE_LIST))))
INC_ROOT := $(MODULE_ROOT)/lib
build-dir := build

P6EXE := perl6
CMAKE := cmake

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
		$(CMAKE) -DINC_ROOT=$(INC_ROOT) -DP6EXE=$(P6EXE) ../src/
	$(MAKE) -C $(build-dir) install

clean:
	-$(RM) -r $(build-dir) $(MODULE_ROOT)/blib
