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

teste1:
	@echo 1 0 1 1
	@echo 1 1 1 1 1 | ./ep1

teste2:
	@echo 3 0 0 2 2 2 3 5
	@echo 3 4 10 331 213 231 330 321 331 | ./ep1

teste3:
	@echo 5 0 2 2 2 3 72364
	@echo 5 8 3 72364 12345 72445 66664 | ./ep1

teste4:
	@echo 6 0 2 2 2 2 6 5
	@echo 6 3 10 012012 210210 111111 000000 222222 012012 | ./ep1

.PHONY: all clean clean_txt clean_all ep1 run teste1 teste2 teste3 teste4

