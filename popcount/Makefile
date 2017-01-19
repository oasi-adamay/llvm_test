CC = clang

TARGET = popcount.exe
SRCS = popcount.c

CFLAGS = -Wall
#CFLAGS += -std=c++14
#CFLAGS += -stdlib=libc++

#CFLAGS += -ferror-limit=1
#CFLAGS += -v


$(TARGET) : popcount.c
	$(CC) $(CFLAGS) $< -o $@

.PHONY: clean
clean:
	rm -f $(TARGET)

.PHONY: run
run:
	$(TARGET)
