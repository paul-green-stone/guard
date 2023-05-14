cc = gcc
objs = temp/guard.o
dirs = temp
CFLAGS =

temp/guard.o:	guard.h guard.c
	$(cc) -c -g -o temp/guard.o guard.c

.PHONY: clean
clean:
	rm -rf $(OBJDIR) ./*.o libguard.a 

$(shell mkdir -p $(OBJDIR))