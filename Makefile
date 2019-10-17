TARGET = unnpk

CFLAGS += -Wall

ifeq ($(OS),Windows_NT)
	LDFLAGS += -lz -lWs2_32
	INCLUDELIB += -Iwindows/sys windows/sys/mman.c
else
	LDFLAGS += -lz 
	INCLUDELIB = 
endif

.PHONY: all clean

all: $(TARGET)

$(TARGET): unnpk.c
	$(CC) $(CFLAGS) $(INCLUDELIB) $< $(LDFLAGS) -o $@

clean:
	rm -f $(TARGET)
