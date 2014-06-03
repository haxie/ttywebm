CC = gcc
CFLAGS = -O2 -Wall
VERSION = 1.0.8

UNAME := $(shell uname)
ifeq ($(UNAME),Darwin)
	TARGET = osx
else
	TARGET = ttywebm
endif

all: $(TARGET)

ttywebm: ttywebm.o io.o 
	$(CC) $(CFLAGS) -o ttywebm ttywebm.o io.o 

osx: ttywebm_osx.o io.o
	$(CC) $(CFLAGS) -o ttywebm ttywebm_osx.o io.o
	
clean:
	rm -f *.o $(TARGET) ttyrecord *~
