C65 = ../tali/c65/c65

all: 2ksa.bin test

clean:
	rm -f 2ksa.asm 2ksa.bin 2ksa.lst 2ksa.sym test.out

2ksa.asm: 2ksa.md extract.py
	python3 extract.py < $< > $@

2ksa.bin: 2ksa.asm
	64tass --nostart $< --output $@ --vice-labels --labels 2ksa.sym --list 2ksa.lst

test: test.in test.exp 2ksa.bin
	@cat test.in | $(C65) -r 2ksa.bin -a 0 -s 0x5b8 | tail +5 | grep -v c65 > test.out
	@diff -q --ignore-space-change test.exp test.out
	@echo "Sample run OK"