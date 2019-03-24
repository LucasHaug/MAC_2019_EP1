BUILD_DIR := build
TARGET := ep1

SOURCES = $(wildcard *.c)
OBJECTS = $(patsubst %.c, $(BUILD_DIR)/%.o, $(SOURCES))

.PHONY: all clean run format

all: $(BUILD_DIR) ep1

$(BUILD_DIR):
	@echo "Creating build directory"
	@mkdir -p $@

$(BUILD_DIR)/%.o: %.c
	gcc -g -Wall -Wextra -o $@ -c $^

clean:
ifeq ($(OS), Windows_NT)
	rm $(BUILD_DIR)/*.o *.exe
	rmdir $(BUILD_DIR)
else
	rm $(BUILD_DIR)/*.o ep1
	rmdir $(BUILD_DIR)
endif

ep1: $(OBJECTS)
	gcc -g -Wall -Wextra -o ep1 $(OBJECTS)

run: all
ifeq ($(OS), Windows_NT)
	start powershell -NoExit ./ep1
else
	./ep1 
endif

