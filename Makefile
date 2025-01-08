# Variables
SRC_DIR = src
TEST_DIR = test
EBIN_DIR = ebin
SRC_FILES = $(wildcard $(SRC_DIR)/*.erl)
TEST_FILES = $(wildcard $(TEST_DIR)/*.erl)
BEAM_FILES = $(SRC_FILES:$(SRC_DIR)/%.erl=$(EBIN_DIR)/%.beam)
TEST_BEAM_FILES = $(TEST_FILES:$(TEST_DIR)/%.erl=$(EBIN_DIR)/%.beam)

# Targets
.PHONY: all compile test clean

# Default target
all: clean compile test

# Compile source and test files
compile: $(EBIN_DIR) $(BEAM_FILES) $(TEST_BEAM_FILES)

$(EBIN_DIR):
	mkdir -p $(EBIN_DIR)

$(EBIN_DIR)/%.beam: $(SRC_DIR)/%.erl
	erlc -o $(EBIN_DIR) $<

$(EBIN_DIR)/%.beam: $(TEST_DIR)/%.erl
	erlc -o $(EBIN_DIR) $<

# Run tests
test: compile
	@$(MAKE) run_tests MODULE=$(MODULE)

run_tests:
ifeq ($(MODULE),)
	@erl -noshell -pa $(EBIN_DIR) -eval \
		"Modules = [M || F <- filelib:wildcard(\"$(EBIN_DIR)/*_test.beam\"), \
		M <- [list_to_atom(filename:basename(F, \".beam\"))]], \
		eunit:test(Modules, [verbose]), \
		init:stop()."
else
	@erl -noshell -pa $(EBIN_DIR) -eval \
		"eunit:test($(MODULE), [verbose]), init:stop()."
endif

# Clean up compiled files
clean:
	rm -rf $(EBIN_DIR)
