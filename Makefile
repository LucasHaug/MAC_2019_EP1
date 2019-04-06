BUILD_DIR := build
TARGET := ep1

SOURCES = $(wildcard *.c)
OBJECTS = $(patsubst %.c, $(BUILD_DIR)/%.o, $(SOURCES))

.PHONY: all clean run format

all: ep1

$(BUILD_DIR):
	@echo "Creating build directory"
	@mkdir -p $@

$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	gcc -g -Wall -Wextra -o $@ -c $^

clean:
ifeq ($(OS), Windows_NT)
	rm -r $(BUILD_DIR) *.exe
else
	rm -r $(BUILD_DIR) ep1
endif

ep1: $(OBJECTS)
	gcc -g -Wall -Wextra -o ep1 $(OBJECTS)

run: all
ifeq ($(OS), Windows_NT)
	start powershell -NoExit ./ep1
else
	./ep1 
endif

