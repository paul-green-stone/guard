cc = gcc
objs = temp/guard.o
dirs = temp
CFLAGS = -c -Wall -Werror -Wextra

temp/guard.o: guard.h guard.c
	$(cc) -g $(CFLAGS) -o temp/guard.o guard.c

lib: temp/*.o
	ar -rc libguard.a temp/*.o

.PHONY: clean

clean:
	rm -rf temp ./*.o a.out 

$(shell mkdir -p $(dirs))