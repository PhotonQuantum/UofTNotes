# Define the source and destination directories
SRC_DIR := src
DEST_DIR := dest

# Define the file to be excluded (relative to the SRC_DIR)
EXCLUDED_FILE := $(SRC_DIR)/sty.typ

# Find all source files recursively in the SRC_DIR, excluding the specified file
SRC_FILES := $(filter-out $(EXCLUDED_FILE), $(shell find $(SRC_DIR) -type f -name "*.typ"))

# Generate a list of corresponding destination files
DEST_FILES := $(SRC_FILES:$(SRC_DIR)/%.typ=$(DEST_DIR)/%.pdf)

# Default target: compile all
all: $(DEST_FILES)

# Rule to compile each .typ file to .pdf in the destination directory while maintaining the directory structure
$(DEST_DIR)/%.pdf: $(SRC_DIR)/%.typ
	@mkdir -p $(dir $@)
	typst compile --root $(SRC_DIR) $< $@

# Clean up
clean: 
	rm -rf $(DEST_DIR)

.PHONY: all clean