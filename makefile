cc = gcc
OBJDIR = objects
OBJS = $(addprefix $(OBJDIR)/, guard.o)
CFLAGS = -c -Wall -Werror -Wextra

lib: $(OBJS)
	ar -rc libguard.a $(OBJS)

$(OBJDIR)/guard.o: guard.h guard.c
	$(cc) -g $(CFLAGS) -o $(OBJDIR)/guard.o guard.c

.PHONY: clean
clean:
	rm -rf $(OBJDIR) ./*.o libguard.a 

$(shell mkdir -p $(OBJDIR))