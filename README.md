Here's a [literate code document](2ksa.md) that compiles to
Robert Ford Denison's *2K Symbolic Assembler for the 6502*.
I imported much of the raw text from the [source PDF](2ksa.pdf) using
[tesseract OCR](https://github.com/tesseract-ocr/tesseract)
and reconstructed the rest to produce the markdown document.

Use `make` to compile a working binary image of the assembler.
This uses `extract.py` to generate `2ksa.asm` which is assembled using `64tass`.
The image is padded to 4K to simplify loading at `$0000`
with the assembler itself occupying 2K from `$200-9ff` followed by nearly 2K
of empty storage space and ending with a few bytes of I/O routines.

You can run the binary with
[c65](https://github.com/SamCoVT/TaliForth2/tree/master-64tass/c65)
like this:

    c65 -r 2ksa.bin -r 2ksa.bin -a 0 -s 0x5b8 -l 2ksa.sym -g

or with [py65mon](https://github.com/mnaberez/py65):

    py65mon -l 2ksa.bin -g 0x5b8