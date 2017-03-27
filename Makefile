#!/bin/bash

.PHONY: clean

UTIL=src/types.fsx src/fileio.fsx src/error.fsx
LIBS=src/lexer.fsx src/parser.fsx src/htmlgenerator.fsx

main: fsrlib
	fsharpc src/$@.fsx

fsrlib:
	fsharpc -a $(UTIL) $(LIBS) -o $@.dll

clean:
	rm -f *.dll
	rm -f main.exe
	rm -rf bin/
	rm -rf obj/