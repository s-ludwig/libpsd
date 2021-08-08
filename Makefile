# Specify the target file and build directory
OUTPUTFILE = libpsd.a
BUILDDIR   = src

SOURCES = $(wildcard src/*.c)
# Get list of object files, with paths
OBJECTS := $(addprefix $(BUILDDIR)/,$(SOURCES:src/%.c=%.o))

CFLAGS := $(CFLAGS) -O2 -I include

# Default target
.PHONY: all
all: $(OUTPUTFILE)

# Build libjohnpaul.a from john.o, paul.o, and johnpaul.o
$(OUTPUTFILE): $(OBJECTS)
	$(AR) -rcs $@ $^

.PHONY: clean 
clean:
	rm src/*.o
	rm *.a

# Indicate dependencies of .c files on .h files
$(BUILDDIR)/%.o: include/libpsd.h
