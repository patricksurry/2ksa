Here's a [literate code document](2ksa.md) that compiles to
[R. Ford Denison](https://cbs.umn.edu/directory/r-ford-denison
)'s *2K Symbolic Assembler for the 6502*.
The original author is "... still using microcomputers (Raspberry Picos running Python) 
to study [nitrogen fixation in soybeans](https://www.youtube.com/channel/UCEP28vPkDtZF8X8rfnXyo6Q
), among other things".  He has given permission "... to share anything based on the 2KSA"
for educational use.

I imported much of the raw text from the [source PDF](2ksa.pdf) using
[imagemagick](https://imagemagick.org/index.php) to extract page images and 
[tesseract OCR](https://github.com/tesseract-ocr/tesseract)
to extract text.  This works reasonably well for prose but most 
code listings were reconstructed by hand to produce the markdown document.

```sh
    magick -density 300 2ksa.pdf -quality 90 2ksa%02d.jpg
    for i in {00..64}; do echo $i; echo $i >> 2ksa.txt; tesseract 2ksa$i.jpg - >> 2ksa.txt; done
```

Use `make` to compile a working binary image of the assembler.
The script `extract.py` generates `2ksa.asm` which is assembled with `64tass`.
The binary image is padded to 8K to simplify loading at `$0000`
with the assembler itself occupying 2K from `$200-9ff` followed by 5K
of empty storage space and ending with I/O routines matching the KIM entrypoints.

You can run the binary with
[c65](https://github.com/SamCoVT/TaliForth2/tree/master-64tass/c65)
like this:

```sh
    c65 -r 2ksa.bin -r 2ksa.bin -a 0 -s 0x5b8 -l 2ksa.sym -g
```

or with [py65mon](https://github.com/mnaberez/py65):

```sh
    py65mon -l 2ksa.bin -g 0x5b8
```

The byte code checksums have been verified against the original document.



