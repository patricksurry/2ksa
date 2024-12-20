all: 2ksa.bin

2ksa.asm: 2ksa.md extract.py
	python3 extract.py < $< > $@

2ksa.bin: 2ksa.asm
	64tass --nostart $< --output $@ --vice-labels --labels 2ksa.sym --list 2ksa.lst