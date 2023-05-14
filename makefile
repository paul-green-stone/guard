cc = gcc
OBJDIR = objects
CFLAGS = -c -Wall -Werror -Wextra

lib: $(OBJDIR)/guard.o
	ar -rc libguard.a $(OBJS)

$(OBJDIR)/guard.o: guard.h guard.c
	$(cc) -g $(CFLAGS) -o $(OBJDIR)/guard.o guard.c

.PHONY: clean
clean:
	rm -rf $(OBJDIR) ./*.o libguard.a 

$(shell mkdir -p $(OBJDIR))