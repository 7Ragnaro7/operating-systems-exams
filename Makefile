# An admittedly primitive Makefile
# To compile, type "make" or make "all"
# To remove files, type "make clean"

CC = gcc
CFLAGS = -Wall
LIB = -lpthread -ldl
OBJS = wserver.o wclient.o request.o io_helper.o sqlite3.o

.SUFFIXES: .c .o 

all: wserver wclient spin.cgi

wserver: wserver.o request.o io_helper.o sqlite3.o
	$(CC) $(CFLAGS) -o wserver wserver.o request.o io_helper.o sqlite3.o $(LIB)

wclient: wclient.o io_helper.o
	$(CC) $(CFLAGS) -o wclient wclient.o io_helper.o

spin.cgi: spin.c
	$(CC) $(CFLAGS) -o spin.cgi spin.c

.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	-rm -f $(OBJS) wserver wclient spin.cgi
