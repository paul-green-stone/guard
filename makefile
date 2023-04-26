cc = gcc
objs = temp/guard.o
dirs = temp
CFLAGS =

temp/guard.o:	guard.h guard.c
	$(cc) -c -g -o temp/guard.o guard.c

.PHONY: clean

clean:
	rm -rf temp ./*.o a.out 

$(shell mkdir -p $(dirs))