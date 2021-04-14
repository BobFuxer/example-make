#!/usr/bin/make -f

#Filename	Makefile
#Date		10/20
#Author		Alexander Greebe
#Course		CS 3377.002
#Email		ajg170006@utdallas.edu
#Version	1.0
#Copyright	2020
#
#Description
#
#Makes the project, links everything together
#Also does the backup
#Based mainly of the example 		

#flags
CC = gcc
CCFLAGS = -Wall
CPP:FLAGS = 

#lex flags
LEX = /bin/flex
YFLAGS = 

YACC = /bin/bison
YFLAGS = -dy

PROJECTNAME = CS3377.HW4

EXECFILE = hw4

OBJS = parse.o scan.o myproject.o

.PRECIOUS: scan.c parse.c

#make stuff

all: $(EXECFILE)

clean:
	rm -f $(OBJS) $(EXECFILE) y.tab.h parse.c scan.c *~ \#*

$(EXECFILE):	$(OBJS)
	$(CC) -o $@ $(OBJS)


backup:
	@make clean
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell basename "`pwd`"))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H:%M:%S').tar.gz)
	@echo
	@echo Writing Backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcfv $(MKBKUPNAME) ../$(CURDIRNAME) 2> /dev/null
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo Done!
