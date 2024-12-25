
        .cpu "6502"
        * = 0
        .fill $200, $ee
.comment
0200    42 52 4B 43 4C 43 43 4C 44 43 4C 49 43 4C 56 44
0210    45 58 44 45 59 49 4E 58 49 4E 59 4E 4F 50 50 48
0220    41 50 48 50 50 4C 41 50 4C 50 52 54 49 52 54 53
0230    53 45 43 53 45 44 53 45 49 54 41 58 54 41 59 54
0240    53 58 54 58 41 54 58 53 54 59 41 43 50 58 53 54
0250    58 4C 44 58 43 50 59 4C 44 59 53 54 59 41 44 43
0260    41 4E 44 43 4D 50 45 4F 52 4C 44 41 4F 52 41 53
0270    42 43 53 54 41 41 53 4C 4C 53 52 52 4F 4C 52 4F
0280    52 44 45 43 49 4E 43 42 49 54 4A 4D 50 4A 53 52
0290    42 43 43 42 43 53 42 45 51 42 4D 49 42 4E 45 42
02A0    50 4C 42 56 43 42 56 53|20 20 41 20 23 20 5A 20
02B0    5A 58 5A 59 49 58 49 59 20 20 20 20 58 20 59 20
02C0    49 20|00 27 19 19 1D 1A 1F 1F 30 19 1D 1B 2E|19
02D0    2B 26 2E 2D 1C 27 27 38 30 2D 27 2F|00 F2 04 11
02E0    22 35 32 3A 31 50 63 75 6E|0C 80 0C A5 02 0E 00
02F0    03 02 37 C0 02 11 00 02 01 0C F8 09 15 00 08 05
0300    08|FF FF FF FF|00 18 D8 58 B8 CA 88 E8 C8 EA 48
0310    08 68 28 40 60 38 F8 78 AA A8 BA 8A 9A 98 0A 4A
0320    2A 6A E0 FF A2 C0 A0 FF 69 29 C9 49 A9 09 E9 E4
0330    86 A6 C4 A4 84 65 25 C5 45 A5 05 E5 85 06 46 26
0340    66 C6 E6 24 B4 94 75 35 D5 55 B5 15 F5 95 16 56
0350    36 76 D6 F6 B6 96 61 21 C1 41 A1 01 E1 81 71 31
0360    D1 51 B1 11 F1 91 90 B0 F0 30 D0 10 50 70 EC 8E
0370    AE CC AC 8C 6D 2D CD 4D AD 0D ED 8D 0E 4E 2E 6E
0380    CE EE 2C 4C 20 BC FF 7D 3D DD 5D BD 1D FD 9D 1E
0390    5E 3E 7E DE FE BE FF FF FF 79 39 D9 59 B9 19 F9
03A0    99 6C FF
.endcomment
MNETAB  ; Three-character ASCII mnemonics for instructions.
        .text "BRK", "CLC", "CLD", "CLI", "CLV", "DEX", "DEY", "INX"
        .text "INY", "NOP", "PHA", "PHP", "PLA", "PLP", "RTI", "RTS"
        .text "SEC", "SED", "SEI", "TAX", "TAY", "TSX", "TXA", "TXS"
        .text "TYA", "CPX", "STX", "LDX", "CPY", "LDY", "STY", "ADC"
        .text "AND", "CMP", "EOR", "LDA", "ORA", "SBC", "STA", "ASL"
        .text "LSR", "ROL", "ROR", "DEC", "INC", "BIT", "JMP", "JSR"
        .text "BCC", "BCS", "BEQ", "BMI", "BNE", "BPL", "BVC", "BVS"

MODTAB  ; Two-character ASCII mode codes.
        .text "  A # Z ZXZYIXIY    X Y I "

MIN     ; Minimum legal value for MNE for each mode.
        .byte $00, $27, $19, $19, $1D, $1A, $1F, $1F, $30, $19, $1D, $1B, $2E

MAX     ; Lowest illegal value of MNE for each mode.
        .byte $19, $2B, $26, $2E, $2D, $1C, $27, $27, $38, $30, $2D, $27, $2F

BASE    ; Base value for mode added to MNE to get OPCPTR.
        .byte $00, $F2, $04, $11, $22, $35, $32, $3A, $31, $50, $63, $75, $6E

PRMTAB  ; Initialization values for CRNTAH through SYMNUM.
        .byte $0C, $80, $0C, $A5, $02, $0E, $00, $03
        .byte $02, $37, $C0, $02, $11, $00, $02, $01
        .byte $0C, $F8, $09, $15, $00, $08, $05, $08

USRPRM  ; Four bytes available for user parameters.
        .byte $FF, $FF, $FF, $FF

OPCTAB  ; Machine language opcodes pointed to by OPCPTR.
        .byte                          $00, $18, $D8, $58, $B8, $CA, $88, $E8, $C8, $EA, $48
        .byte $08, $68, $28, $40, $60, $38, $F8, $78, $AA, $A8, $BA, $8A, $9A, $98, $0A, $4A
        .byte $2A, $6A, $E0, $FF, $A2, $C0, $A0, $FF, $69, $29, $C9, $49, $A9, $09, $E9, $E4
        .byte $86, $A6, $C4, $A4, $84, $65, $25, $C5, $45, $A5, $05, $E5, $85, $06, $46, $26
        .byte $66, $C6, $E6, $24, $B4, $94, $75, $35, $D5, $55, $B5, $15, $F5, $95, $16, $56
        .byte $36, $76, $D6, $F6, $B6, $96, $61, $21, $C1, $41, $A1, $01, $E1, $81, $71, $31
        .byte $D1, $51, $B1, $11, $F1, $91, $90, $B0, $F0, $30, $D0, $10, $50, $70, $EC, $8E
        .byte $AE, $CC, $AC, $8C, $6D, $2D, $CD, $4D, $AD, $0D, $ED, $8D, $0E, $4E, $2E, $6E
        .byte $CE, $EE, $2C, $4C, $20, $BC, $FF, $7D, $3D, $DD, $5D, $BD, $1D, $FD, $9D, $1E
        .byte $5E, $3E, $7E, $DE, $FE, $BE, $FF, $FF, $FF, $79, $39, $D9, $59, $B9, $19, $F9
        .byte $99, $6C, $FF
MATCH   ; $03A3

        STX     ADL             ; Put address of
        LDX     #$00            ; search parameter
        STX     ADH             ; list in ADL, H.
        LDY     #$06            
_PARAM  LDA     (ADL),y         ; Move parameters
        STA     TBL,y           ; to workspace.
        DEY                     
        BPL     _PARAM          
        LDX     NUM             ; Compare X records.
_RECORD LDY     HBC             
_BYTE   LDA     (TBL),y         ; First Y+1 bytes
        CMP     (RFL),y         ; must match.
        BEQ     _OK             
        LDY     #$FF            ; Mismatch.
_OK     DEY                     
        BPL     _BYTE           
        INY                     ; All ok?
        BNE     _INCADR         
        RTS                     ; z set.

_INCADR SEC                     
        LDA     TBL             ; Find base address
        SBC     LEN             ; of next record.
        STA     TBL             
        BCS     _DECNUM         
        DEC     TBH             
_DECNUM DEX                     
        BPL     _RECORD         ; Last record?
        RTS                     ; z clear.

HEX     ; $03D5

        LDA     IOBUF,x         ; Get character.
        CMP     #$40            ; Number or letter?
        BMI     _NUMER          
        SEC                     ; Letter; adjust.
        SBC     #$07            
_NUMER  AND     #$0F            ; Convert to binary.
        RTS                     

HX2BIN  ; $03E1

        JSR     HEX             ; Find high byte,
        ASL                     
        ASL                     
        ASL                     
        ASL                     
        STA     TEMP            
        INX                     ; and low byte.
        JSR     HEX             
        ORA     TEMP            ; Combine.
        TAX                     
        RTS                     

BIN2HX  ; $03F2

        CMP     #$0A            ; Number of letter?
        BMI     _NUMER          
        CLC                     ; Letter; adjust.
        ADC     #$07            
_NUMER  CLC                     ; Convert to ASCII.
        ADC     #$30            
        STA     IOBUF,x         ; Store character.
        RTS                     

DSPHEX  ; $03FF

        PHA                     ; Save number.
        LSR                     ; Find high character.
        LSR                     
        LSR                     
        LSR                     
        JSR     BIN2HX          
        INX                     ; Find low character.
        PLA                     
        AND     #$0F            
        JSR     BIN2HX          
        RTS                     

SYM     ; $040F

        SEC                     ; Find difference
        STX     TEMP            ; between last
        LDA     SYMNUM          ; record and X
        SBC     TEMP            
        STA     MISCL           
        LDA     #$00            
        STA     MISCH           
        CLC                     
        LDY     #$02            
_X8     ROL     MISCL           ; Multiply by 8
        ROL     MISCH           ; bytes per record.
        DEY                     
        BPL     _X8             
        SEC                     ; Subtract from
        LDA     SYMTBL          ; address of
        SBC     MISCL           ; last record.
        STA     MISCL           
        LDA     SYMTBH          
        SBC     MISCH           
        STA     MISCH           
        RTS                     

ADDRSS  ; $0434

        JSR     SYM             ; Get base address.
        LDY     #$06            ; Get symbol address.
        LDA     (MISCL),y       
        STA     ADL             ; Put in ADL, H.
        INY                     
        LDA     (MISCL),y       
        STA     ADH             
        RTS                     

ADDLAB  ; $0443

        STA     ADL             ; ADL,H points
        LDA     #$00            ; to symbol.
        STA     ADH             
        CLC                     
        LDA     SYMTBL          ; Find new base
        ADC     #$08            ; address of
        STA     SYMTBL          ; symbol table.
        BCC     _NOADDR         
        INC     SYMTBH          
_NOADDR LDY     #$07            
        LDA     #$FF            ; Set high address
        STA     (SYMTBL),y      ; =FF (unassigned)
        DEY                     
        DEY                     
_XFRSYM LDA     (ADL),y         ; Add symbol to
        STA     (SYMTBL),y      ; symbol table.
        DEY                     
        BPL     _XFRSYM         
        LDX     SYMNUM          ; Increment number
        INX                     ; of symbols
        STX     SYMNUM          
        RTS                     

NEWSYM  ; $0469

        STA     SYMRFL          ; Set up search
        LDX     #$50            
        JSR     MATCH           ; Look up symbol
        BEQ     _OLD            
        LDA     SYMRFL          ; Not found; add
        JSR     ADDLAB          ; to symbol table.
_OLD    JSR     SYM             ; Address in MISCL, H.
        CPX     SYMNUM          ; Set z if new.
        RTS                     

ENCODE  ; $047D

        LDX     #$42            ; Find mnemonic.
        JSR     MATCH           
        BEQ     _MNEFND         
        LDA     #$31            ; "1" Error-
        RTS                     ; not found.

_MNEFND STX     MNE             ; Save mnemonic.
        LDX     #$49            
        JSR     MATCH           ; Find address mode.
        BEQ     _MODFND         
        LDA     #$32            ; "2" Error-
        RTS                     ; not found.

_MODFND LDA     MNE             ; Special cases:
        CMP     #$19            
        BPL     _NOTIMP         
        LDX     #$00            ; Implied mode.
_NOTIMP CMP     #$30            
        BMI     _NOTREL         
        LDX     #$08            ; Relative mode.
_NOTREL NOP                     

ENCODE2 ; $04A2

        LDA     MNE             ; Legal mnemonic
        CMP     MIN,x           ; for address mode?
        BPL     _NOT2LO         
        LDA     #$33            ; "3" Too low.
        RTS                     

_NOT2LO CMP     MAX,x           
        BMI     _NOT2HI         
        LDA     #$33            ; "3" Too high.
        RTS                     

_NOT2HI CLC                     
        ADC     BASE,x          
        STA     OPCPTR          ; Store pointer
        TAX                     ; to opcode
        LDA     OPCTAB,x        
        CMP     #$FF            
        BNE     _OPCLGL         
        LDA     #$33            ; "3" Illegal.
        RTS                     
_OPCLGL NOP                     ; Continue.

ENCODE3 ; $04C6

        LDA     OPCPTR          ; Consider opcode.
        CMP     #$1D            
        BPL     _OPRRQD         ; Operand required?
        LDA     #$2D            ; "-"
        RTS                     

_OPRRQD INC     BYTES           ; At least 2 bytes.
        CMP     #$2A            
        BPL     _NOTIMM         
        LDX     #$15            ; Immediate addressing.
        JSR     HX2BIN          ; Find binary value
        STX     SYMPTR          
        LDA     #$2D            ; "-"
        RTS                     

_NOTIMM LDX     #$15            ; Set up operand search.
        STX     SYMRFL          
        CMP     #$61            
        BPL     _NOTZPG         ; Zpage addressing?
        LDX     #$50            ; Yes.
        JSR     MATCH           ; Look up operand.
        BEQ     _FOUND          
        LDA     #$34            ; "4" Not found.
        RTS                     

_FOUND  JSR     ADDRSS          
        BEQ     _OK             
        LDA     #$35            ; "5" Not zpage.
        RTS                     

_OK     STX     SYMPTR          ; Store operand.
        LDA     OFFSET          ; Check for offset.
        CMP     #$20            ; "SP"
        BEQ     _DONE           
        LDA     #$36            ; "6" offset illegal.
        RTS                     

_DONE   LDA     #$2D            ; "-"
        RTS                     ; OK, return.
_NOTZPG NOP                     ; Continue.

ENCODE4 ; $0508

        LDX     #$50            ; Look up operand.
        JSR     MATCH           
        BEQ     _FOUND          
        LDA     #$15            ; Not found; add
        JSR     ADDLAB          ; to symbol table.
_FOUND  STX     SYMPTR          
        LDA     OPCPTR          
        CMP     #$69            ; Relative addressing?
        BPL     _NOTREL         
        CPX     GLOBAL          
        BPL     _OK             
        LDA     #$37            ; "7" Brror-
        RTS                     ; branch not local.
_OK     LDA     #$2D            ; "-"
        RTS                     
_NOTREL NOP                     

ENCODE5 ; $0527

        CPX     GLOBAL          ; Operand must
        BMI     _OK             ; be global or
        JSR     ADDRSS          ; outside block.
        CMP     CRNTAH          
        BNE     _OK             
        LDA     #$38            ; "8" Absolute
        RTS                     ; mode w/in block.

_OK     LDA     OFFSET          
        LDX     #$00            
        CMP     #$20            ; "SP"
        BEQ     _STROFS         
        LDX     #$1C            ; Find offset.
        JSR     HX2BIN          
_STROFS STX     OPRDSP          
        INC     BYTES           
        LDA     #$2D            ; "." Stay in
        RTS                     ; edit mode.

CMAND   ; $0549

        LDA     MODE            ; Command legal
        CMP     IOBUF           ; for mode?
        BEQ     _OK             
        CLC                     ; No; illegal.
        ADC     #$0C            ; Return "9" or "K"
        RTS                     

_OK     LDA     #$00            ; Look up command.
        STA     SYMRFL          
        LDX     #$50            
        JSR     MATCH           
        BEQ     _FOUND          
        LDA     IOBUF           ; Not found.
        CMP     #$3F            
        BPL     _CMODE          
        LDA     #$30            ; "0" Error-
        RTS                     ; input mode.

_CMODE  LDA     #$41            ; "A" Error-
        RTS                     ; command mode.

_FOUND  LDA     #$05            ; Set up return.
        PHA                     
        LDA     #$75            
        PHA                     
        JSR     ADDRSS          ; Get address.
        JMP     (ADL)           ; Execute command.
        RTS                     

FIN     ; $0577

        JSR     INSERT          ; Adjust if inserting.
        LDY     BYTES           
        DEY                     
_ADDLIN LDA     OPCPTR,y        ; Add line
        STA     (CRNTAL),y      ; to program.
        DEY                     
        BPL     _ADDLIN         
        LDA     LABEL           
        CMP     #$20            ; "SP"
        BEQ     _INCADR         ; Any label?
        LDA     #$07            ; Yes. Add to
        JSR     NEWSYM          ; symbol table
        LDY     #$07            ; if new, and
        LDA     CRNTAH          ; assign address.
        STA     (MISCL),y       
        DEY                     
        LDA     CRNTAL          
        STA     (MISCL),y       
_INCADR CLC                     
        LDA     CRNTAL          ; Increment pointers.
        ADC     BYTES           
        STA     CRNTAL          
        CLC                     
        LDA     PRGLEN          
        ADC     BYTES           
        STA     PRGLEN          
        BPL     _OK             
        LDA     #$42            ; "B" Error-
        RTS                     ; program overflow.

_OK     BIT     SYMNUM          
        BVC     _OK2            
        LDA     #$43            ; "C" Error-
        RTS                     ; symbol overflow.

_OK2    LDA     #$2D            
        RTS                     

MAIN    ; $05B8

        CLD                     
        LDX     #$18            ; Initialize
_INIT   LDA     PRMTAB,x        ; program parameters.
        STA     CRNTAH,x        
        DEX                     
        BPL     _INIT           
        LDA     #$3F            ; "?" Set.
_START  STA     IOBUF           ; command mode.
        LDY     #$20            ; "SP"
        LDX     #$21            
_CLEAR  STY     IOBUF+$01,x     ; Clear I/O buffer
        DEX                     ; except error code.
        BPL     _CLEAR          
        LDX     #$3F            ; "?" Command.
        CMP     #$3F            ; Command mode?
        BPL     _GETLIN         
        LDA     CRNTAH          ; No; input mode.
        LDX     #$02            ; Display address.
        JSR     DSPHEX          
        LDA     CRNTAL          
        LDX     #$04            
        JSR     DSPHEX          
        LDX     #$2D            ; "-" Input.
_GETLIN STX     MODE            ; Save mode.
        LDA     #$01            ; Initialize.
        STA     BYTES           
        JSR     INPUT           ; Input line.
        LDA     MODE            ; Mode?
        CMP     #$2D            ; "-"
        BNE     _CMODE          ; Command mode?
        LDA     IOBUF+$01       ; Input mode command?
        CMP     #$20            ; "SP"
_CMODE  BNE     _EXEC           ; If neither,
        JSR     ENCODE          ; translate line.
        CMP     #$2D            ; "SP"
        BNE     _NG             ; If line legal,
        JSR     FIN             ; add to program.
_NG     LDX     #$00            
_EXEC   BEQ     _DONE           ; If command,
        JSR     CMAND           ; execute it.
_DONE   CLC                     
        BCC     _START          ; Repeat until reset.
        NOP                     

CONTROL_BEGIN; $0610

        LDA     #$07            ; Add name to
        JSR     NEWSYM          ; symbol table.
        BEQ     _OK             
        LDA     #$44            ; "D" Error-
        RTS                     ; label in use.

_OK     STX     GLOBAL          ; Set local cutoff.
        LDA     #$00            ; Clear pointers.
        STA     CRNTAL          
        STA     PRGLEN          
        LDY     #$06            
        STA     (MISCL),y       ; Set start address
        LDA     CRNTAH          ; =CRNTAL, H.
        INY                     
        STA     (MISCL),y       
        LDA     #$2D            ; "-" Set
        RTS                     ; input mode.

CONTROL_ASSGN; $062E

        LDA     LABEL           
_START  CMP     #$20            ; "Sp"
        BNE     _MORE           ; Label supplied?
        LDA     #$3F            ; No; done.
        RTS                     

_MORE   LDA     #$07            
        JSR     NEWSYM          ; Add symbol to table.
        BEQ     _NOTOLD         
        LDA     #$44            ; "D" Error-
        RTS                     ; label in use.

_NOTOLD LDX     #$0E            ; Assign address.
        JSR     HX2BIN          
        LDY     #$07            
        TXA                     
        STA     (MISCL),y       
        LDX     #$10            
        JSR     HX2BIN          
        DEY                     
        TXA                     
        STA     (MISCL),y       
        LDA     #$20            ; "SP"
        LDX     #$0C            ; clear I/O buffer
_CLEAR  STA     LABEL,x         ; except prompt.
        DEX                     
        BPL     _CLEAR          
        JSR     INPUT           ; Next symbol.
        LDA     LABEL           
        BPL     _START          
        NOP                     

EDIT_LOCAL; $0665

        JSR     CONTROL_ASSGN   ; Add to
        CMP     #$44            ; symbol table
        BNE     _OK             ; if new.
        LDA     #$3A            ; ";" Error-
        RTS                     ; symbol in use.

_OK     LDA     #$2D            ; "."" stay in
        RTS                     ; input mode.

CONTROL_REDEF; $0672

        LDX     #$07            ; Find high address.
        JSR     HX2BIN          
        STX     MDLADH          ; Store.
        LDX     #$09            ; Find low address.
        JSR     HX2BIN          
        STX     MDLADL          ; Store.
        LDA     #$3F            ; "2" stay in
        RTS                     ; command mode.

ASMBL   ; $0683

        LDY     #$00            ; Get first byte.
        LDA     (CRNTAL),y      
        TAX                     
        LDA     OPCTAB,x        ; Look up opcode.
        STA     (OBJECT),y      
        CPX     #$1D            
        BPL     _OPREQ          
        RTS                     ; No operand.

_OPREQ  INY                     
        LDA     (CRNTAL),y      
        CPX     #$2A            
        BPL     _NOTIMM         ; Address mode?
        STA     (OBJECT),y      ; Immediate.
        RTS                     

_NOTIMM STX     MNE             
        TAX                     
        JSR     ADDRSS          ; Get address.
        LDA     ADL             
        LDY     #$01            
        LDX     MNE             
        CPX     #$61            
        BPL     _NOTZPG         
        STA     (OBJECT),y      ; Zero page.
        RTS                     

_NOTZPG CPX     #$69            
        BPL     _NOTREL         
        SEC                     ; Relative
        SBC     #$02            ; Compute branch.
        SEC                     
        SBC     CRNTAL          
        STA     (OBJECT),y      
        RTS                     

_NOTREL CLC                     ; Absolute.
        INY                     
        ADC     (CRNTAL),y      ; Add offset.
        DEY                     
        STA     (OBJECT),y      
        INY                     
        LDA     ADH             
        ADC     #$00            
        STA     (OBJECT),y      
        RTS                     

LOCSYM  ; $06CB

        LDX     GLOBAL          ; For local symbols.
_NXTSYM INX                     
        JSR     ADDRSS          ; see if defined.
        CMP     #$FF            
        BNE     _DEFIND         ; If not,
        LDY     #$05            ; display symbol.
_SHOW   LDA     (MISCL),y       
        STA     IOBUF,y         
        DEY                     
        BPL     _SHOW           
        STX     MISCL           
        JSR     OUTLIN          
        LDX     MISCL           
_DEFIND CPX     SYMNUM          ; If more
        BMI     _NXTSYM         ; symbols, repeat.
        RTS                     

EDIT_ASSEM; $06EB

        JSR     LOCSYM          ; Check for local
        LDA     #$2D            ; undefined symbols.
        CMP     IOBUF           
        BEQ     _ALLOK          ; If any; return.
        RTS                     

_ALLOK  LDA     #$00            ; Else, assemble.
        STA     CRNTAL          ; Initialize pointers.
        LDA     MDLADL          
        STA     OBJECT          
        LDA     MDLADH          
        STA     OBJCT1          
_NEXTLN JSR     ASMBL           ; Translate a line.
        STY     TEMP            ; Save bytes -1.
        SEC                     ; Increment pointers.
        LDA     OBJECT          ; For object code.
        ADC     TEMP            
        STA     OBJECT          
        BCC     _SKIP           
        INC     OBJCT1          
_SKIP   SEC                     ; For source code.
        LDA     CRNTAL          
        ADC     TEMP            
        STA     CRNTAL          
        CMP     PRGLEN          
        BMI     _NEXTLN         ; Finished?
        LDA     #$2D            ; "-" Stay in
        RTS                     ; edit mode.

CONTROL_TABLE; $071F

        LDA     LABEL           
_START  CMP     #$20            ; "SP"
        BNE     _MORE           ; Any label?
        LDA     #$3F            ; No; done.
        RTS                     

_MORE   LDA     #$07            
        JSR     NEWSYM          ; Add symbol to
        BEQ     _NOTOLD         ; symbol table.
        LDA     #$44            ; "D" Error-
        RTS                     ; not new.

_NOTOLD LDY     #$06            ; Assign address.
        LDA     MDLADL          
        STA     (MISCL),y       
        INY                     
        LDA     MDLADH          
        STA     (MISCL),y       
        LDX     #$0E            ; Allocate space
        JSR     HX2BIN          ; by incrementing
        TXA                     ; MDLADL, H.
        CLC                     
        ADC     MDLADL          
        STA     MDLADL          
        BCC     _NOINC          
        INC     MDLADH          
_NOINC  LDA     #$20            ; "SP"
        LDX     #$0C            
_CLEAR  STA     LABEL,x         ; Clear I/O buffer
        DEX                     ; except prompt.
        BPL     _CLEAR          
        JSR     INPUT           
        LDA     LABEL           ; Another symbol?
        BPL     _START          
        NOP                     

INPUT   ; $075D

        JSR     CRLF            ; New line.
        LDX     #$00            ; Prompt w/
_PROMPT LDA     IOBUF,x         ; first 6 chars.
        JSR     OUTCH           
        INX                     
        CPX     #$06            
        BMI     _PROMPT         
        LDX     #$00            ; Initialize pointer.
        LDA     #$06            ; 7 chars/word
        STA     TEMP            ; includes space.
_START  JSR     GETCH           ; Input a char.
        CMP     #$1B            ; "ESC"
        BNE     _NOTBRK         
        BRK                     ; Break.

_NOTBRK CMP     #$0D            ; "CR"
        BNE     _NOTCR          
        RTS                     ; End of line.

_NOTCR  CMP     #$08            ; "BS"
        BNE     _NOTBSP         
        DEX                     ; Backspace.
        INC     TEMP            
        LDA     #$08            
_NOTBSP CMP     #$20            ; "SP"
        BNE     _NOTSP          
        NOP                     ; Next word.
_TAB    JSR     OUTSP           ; Add spaces
        INX                     ; to fill word.
        DEC     TEMP            
        BPL     _TAB            
        LDA     #$06            
        STA     TEMP            
_NOTSP  CMP     #$20            ; If not a
        BMI     _DONE           ; control char:
        STA     IOBUF,x         ; Add char to
        INX                     ; I/O buffer.
        DEC     TEMP            
_DONE   CLC                     
        BCC     _START          ; Next character.
        NOP                     

EDIT_STORE; $07A6

        LDX     GLOBAL          ; Clear local
        JSR     SYM             ; symbols from
        STX     SYMNUM          ; symbol table.
        LDA     MISCL           
        STA     SYMTBL          
        LDA     MISCH           
        STA     SYMTBH          
        LDY     #$07            ; Assign address
        LDA     MDLADH          ; to module.
        STA     (MISCL),y       
        DEY                     
        LDA     MDLADL          
        STA     (MISCL),y       
        CLC                     
        ADC     PRGLEN          ; Increment MDLADL,H
        STA     MDLADL          ; by length of
        BCC     _SKIP           ; module.
        INC     MDLADH          
_SKIP   LDA     #$3F            ; "?" Return to
        RTS                     ; command mode.

MODLIM  ; $07CC

    .byte $00, $19, $1D, $2A, $3F, $4F, $51, $59, $61, $69, $80, $90, $9C

DECODE  ; $07D9

        LDA     #$01            ; Assume 1 byte.
        STA     BYTES           
        LDX     #$22            ; Clear I/O buffer.
        LDA     #$20            
_CLEAR  STA     IOBUF,x         
        DEX                     
        BPL     _CLEAR          
        LDX     SYMNUM          ; Check for label.
_START  JSR     ADDRSS          ; Compare address
        LDA     CRNTAL          ; to current line.
        CMP     ADL             
        BNE     _SKIP           
        LDA     CRNTAH          
        CMP     ADH             
_SKIP   BNE     _SKIP2          ; If they match,
        LDY     #$05            ; put label in
_LABL   LDA     (MISCL),y       ; I/O buffer.
        STA     LABEL,y         
        DEY                     
        BPL     _LABL           
        LDX     #$01            ; End search
_SKIP2  DEX                     
        CPX     GLOBAL          ; Consider local
        BPL     _START          ; symbols only.
        LDY     #$00            ; Get opcode.
        LDA     (OBJECT),y      
        LDX     #$00            ; Put opcode in
        JSR     DSPHEX          ; I/O buffer.
        LDA     (CRNTAL),y      ; Decode opcode.
        STA     OPCPTR          

DECODE2 ; $0815

        LDX     #$0C            ; Find mode.
        CMP     #$1D            ; Any operand?
        BPL     _FNDMOD         ; If not, only check
        LDX     #$01            ; implied and accum.
_FNDMOD CMP     MODLIM,x        ; In range
        BMI     _NOPE           ; for mode?
        STX     MODE            ; Yes; save mode.
        LDX     #$00            ; End search.
_NOPE   DEX                     
        BPL     _FNDMOD         
        LDA     MODE            ; Put mode in
        ASL                     ; I/O buffer.
        TAX                     
        LDA     MODTAB,x        
        STA     OPCODE+$03      
        LDA     MODTAB+$01,x    
        STA     OPCODE+$04      
        LDA     (CRNTAL),y      ; Find mnemonic. 7
        SEC                     
        LDX     MODE            
        SBC     BASE,x          ; Mnemonic number.
        STA     TEMP            ; Multiply by 3.
        ASL                     
        CLC                     
        ADC     TEMP            
        TAX                     ; Get ASCII.
        LDA     MNETAB,x        ; Put mnemonic in
        STA     OPCODE          ; I/O buffer.
        LDA     MNETAB+$01,x    
        STA     OPCODE+$01      
        LDA     MNETAB+$02,x    
        STA     OPCODE+$02      
        LDA     OPCPTR          ; Operand needed?
        CMP     #$1D            
        BPL     _OPRND          
        RTS                     ; No; finished.
_OPRND  INC     BYTES           ; At least 2 bytes.

DECODE3 ; $085E

        LDY     #$01            
        LDA     (OBJECT),y      ; Machine code
        LDX     #$02            ; for operand in
        JSR     DSPHEX          ; I/O buffer.
        LDA     OPCPTR          
        CMP     #$2A            ; Immediate mode?
        BPL     _NOTIMM         
        LDA     (CRNTAL),y      ; Yes; put hex
        LDX     #$15            ; number in
        JSR     DSPHEX          ; I/O buffer.
        RTS                     

_NOTIMM LDA     (CRNTAL),y      ; No; look up
        TAX                     ; operand.
        JSR     SYM             
        LDY     #$05            ; Put operand
_SHOWOP LDA     (MISCL),y       ; in IOBUF.
        STA     OPRAND,y        
        DEY                     
        BPL     _SHOWOP         
        LDA     OPCPTR          ; 3-byte instruction.
        CMP     #$69            
        BPL     _ABS            
        RTS                     ; No; done

_ABS    INC     BYTES           ; Yes.
        LDY     #$02            
        LDA     (OBJECT),y      ; Add code to
        LDX     #$04            ; I/O buffer.
        JSR     DSPHEX          
        LDA     (CRNTAL),y      ; Offset?
        BEQ     _DONE           
        LDX     #$1C            ; Show offset.
        JSR     DSPHEX          
_DONE   RTS                     

OUTLIN  ; $08A1

        JSR     CRLF            ; New line.
        LDX     #$00            
_NXTCHR LDA     IOBUF,x         ; Output one
        JSR     OUTCH           ; character at
        INX                     ; a time,
        CPX     #$23            ; until done.
        BMI     _NXTCHR         
        RTS                     

PRNTCK  ; $08B1

        LDA     #$00            ; Initialize.
        STA     CRNTAL          
        LDA     MDLADL          
        STA     OBJECT          
        LDA     MDLADH          
        STA     OBJCT1          
        LDX     #$07            ; Decode range.
        JSR     HX2BIN          
        STX     FIRST           
        LDX     #$0B            
        JSR     HX2BIN          
        STX     LAST            
        LDA     #$02            ; Initialize flag
        STA     WRONG           ; for mismatch.
_NXTLIN JSR     DECODE          ; Decode line.
        LDA     CRNTAL          
        CMP     FIRST           ; Decrement WRONG
        BNE     _SKIP           ; each time a
        DEC     WRONG           ; match is found.
_SKIP   CMP     LAST            
        BNE     _SKIP2          
        DEC     WRONG           
_SKIP2  CMP     FIRST           ; In range
        BMI     _LOW            ; for print?
        CMP     LAST            
        BPL     _HIGH           
        BIT     PRNTOK          ; Yes, but
        BMI     _NOPRNT         ; print wanted?
        LDX     #$1F            ; Yes; add
        JSR     DSPHEX          ; line number.
        JSR     OUTLIN          ; Print line.
_NOPRNT NOP                     
_HIGH   NOP                     
_LOW    CLC                     ; Update pointers.
        LDA     OBJECT          
        ADC     BYTES           
        STA     OBJECT          
        BCC     _NOINC          
        INC     OBJCT1          
_NOINC  CLC                     
        LDA     CRNTAL          
        ADC     BYTES           
        STA     CRNTAL          
        CMP     PRGLEN          ; Last line?
        BMI     _NXTLIN         ; If not, repeat.
        RTS                     

EDIT_PRINT; $090D

        LDA     #$01            ; Set print flag.
        STA     PRNTOK          
        JSR     PRNTCK          ; Run print routine.
        LDA     #$2D            ; "-" Stay in
        RTS                     ; edit mode.

FIXSYM  ; $0917

        LDX     SYMNUM          ; For local symbols,
_START  JSR     ADDRSS          ; find address.
        CMP     CRNTAH          ; Line label?
        BNE     _NOTLAB         
        LDA     ADL             ; Yes, but in
        CMP     CRNTAL          ; move zone?
        BMI     _NOREV          
        LDY     ADL             ; Yes.
        CPY     LAST            ; Line deleted?
        BPL     _NEWADR         
        LDA     #$FE            ; Yes.
        LDY     #$07            ; Delete symbol.
        STA     (MISCL),y       
_NEWADR CLC                     ; Fix address
        ADC     BYTES           
        LDY     #$06            
        STA     (MISCL),y       
_NOREV  NOP                     
_NOTLAB DEX                     ; More local
        CPX     GLOBAL          ; symbols?
        BPL     _START          
        RTS                     

INSERT  ; $0940

        LDA     CRNTAL          ; Inserting line?
        CMP     PRGLEN          
        BNE     _INS            
        RTS                     ; Nope.

_INS    STA     LAST            
        JSR     FIXSYM          ; Fix symbols.
        CLC                     
        LDA     CRNTAL          ; Set up offset
        ADC     BYTES           ; pointer for move.
        STA     ADL             
        LDA     CRNTAH          
        STA     ADH             
        LDA     PRGLEN          
        SEC                     
        SBC     CRNTAL          
        TAY                     
_MOVE   LDA     (CRNTAL),y      ; Move lines to
        STA     (ADL),y         ; open gap.
        DEY                     
        BPL     _MOVE           
        RTS                     

EDIT_INSRT; $0965

        LDA     #$FF            ; Legal line?
        STA     PRNTOK          
        JSR     PRNTCK          
        CMP     LAST            ; Last+1 is
        BNE     _NOTLST         ; legal line
        DEC     WRONG           ; number.
_NOTLST LDA     WRONG           
        BEQ     _OK             
        LDA     #$25            ; "%" Error-
        RTS                     ; illegal address.

_OK     LDA     FIRST           
        STA     CRNTAL          
        LDX     LAST            ; Deletion needed?
        BEQ     _DONE           
        SEC                     ; Fix addresses
        SBC     LAST            ; for labels.
        STA     BYTES           
        JSR     FIXSYM          
        LDA     CRNTAH          ; Set pointer
        STA     LAST1           ; for move.
        LDA     PRGLEN          ; Find bytes
        SEC                     ; to move.
        SBC     CRNTAL          
        STA     TEMP            
        LDA     PRGLEN          ; Correct length
        CLC                     ; of program.
        ADC     BYTES           
        STA     PRGLEN          
        LDY     #$00            ; Move lines to
_MOVE   LDA     (LAST),y        ; close gap.
        STA     (CRNTAL),y      
        INY                     
        CPY     TEMP            
        BMI     _MOVE           
        NOP                     
_DONE   LDA     #$2D            ; "-" Stay in
        RTS                     ; edit mode.


        LDX     #$47            
_MOVSYM LDA     ROM,x           
        STA     RAM,x           
        DEX                     
        BPL     _MOVSYM         
        JMP     MAIN            

COMAND  ; $09C0
ROM = *
RAM = *
.comment
                                        09B8    3F 41 53 53 47 4E 2E 06
09C0    3F 42 45 47 49 4E 10 06         09C8    2D 4C 4F 43 41 4C 65 06
09D0    3F 52 45 44 45 46 72 06         09D8    2D 41 53 53 45 4D EB 06
09E0    3F 54 41 42 4C 45 1F 07         09E8    2D 53 54 4F 52 45 A6 07
09F0    2D 50 52 49 4E 54 0D 09         09F8    2D 49 4E 53 52 54 65 09
.endcomment
        .text "?ASSGN"
        .word CONTROL_ASSGN

        .text "?BEGIN"
        .word CONTROL_BEGIN

        .text "-LOCAL"
        .word EDIT_LOCAL

        .text "?REDEF"
        .word CONTROL_REDEF

        .text "-ASSEM"
        .word EDIT_ASSEM

        .text "?TABLE"
        .word CONTROL_TABLE

        .text "-STORE"
        .word EDIT_STORE

        .text "-PRINT"
        .word EDIT_PRINT

        .text "-INSRT"
        .word EDIT_INSRT

IOBUF   = $0000                 ; I/O buffer; prompt or command field.
LABEL   = $0007                 ; I/O buffer; label field.
OPCODE  = $000E                 ; I/O buffer; opcode field.
OPRAND  = $0015                 ; I/O buffer; operand field.
OFFSET  = $001C                 ; I/O buffer; offset field.
USER    = $0023                 ; Six bytes available for use by user commands.
ADL     = $0029                 ; Low address pointer for various subroutines.
ADH     = $002A                 ; High address pointer.
MISCL   = $002B                 ; Miscellaneous uses.
MISCH   = $002C                 ; Ditto.
TEMP    = $002D                 ; Various temporary uses.
MNE     = $002E                 ; Mnemonic code.
BYTES   = $002F                 ; Lengths of lines, etc.
TBL     = $0030                 ; Low address pointer for table; used by MATCH.
TBH     = $0031                 ; High address pointer (Subroutine MATCH).
RFL     = $0032                 ; Low address pointer for string to be matched.
RFH     = $0033                 ; High address pointer (MATCH).
LEN     = $0034                 ; Length of each record in table (MATCH).
HBC     = $0035                 ; Number of highest byte in record which must match.
NUM     = $0036                 ; Number of highest record in table (MATCH). .
OPCPTR  = $0037                 ; Pointer to opcode in OPCTAB.
PRNTOK  = $0038                 ; Flag to enable printing by Subroutine PRNTCK.
WRONG   = $0039                 ; Flag for illegal line numbers (PRNTCK).
MODE    = $003A                 ; Code for address mode.
SAVX    = $003B                 ; Used to preserve X register.
GLOBAL  = $003C                 ; Number of last global symbol.
PRGLEN  = $003D                 ; Length of source code.
CRNTAL  = $003E                 ; Low address pointer to current source code line.
CRNTAH  = $003F                 ; High address pointer.
MDLADL  = $0040                 ; Module pointer, low address.
MDLADH  = $0041                 ; Module pointer, high address.
MNETBL  = $0042                 ; Parameters for MNETAB (see TBL to NUM above).
MODTBL  = $0049                 ; Parameters for MODTAB.
SYMTBL  = $0050                 ; Low address pointer to last entry in symbol table.
SYMTBH  = $0051                 ; High address pointer.
SYMRFL  = $0052                 ; Low address pointer for symbol to be compared.
SYMRFH  = $0053                 ; High address pointer.
SYMNUM  = $0056                 ; Number of last symbol.
OBJECT  = $0057                 ; Low address pointer to object code.
OBJCT1  = $0058                 ; High address pointer.
FIRST   = $0059                 ; First line in range for print (PRNTCK).
LAST    = $005A                 ; First line after print range.
LAST1   = $005B                 ; High order address; same as CRNTAH.

SYMPTR = $38    ; overlaps with PRNTOK, written but not read?
OPRDSP = $39    ; overlaps with WRONG, written but not read?
.comment
CRLF    1E2F    Carriage return, line feed          075D, 08A1 (255D, 26A1)
OUTCH   1EA0    Output ASCII from A, preserve X.    0764, 08A8 (2564, 26A8)
GETCH   1E5A    Input ASCII to A, preserve X.       0772 (2572)
OUTSP   1E9E    Output one space.                   078D (258D)
.endcomment
        * = $1E2F               
;        * = $834D               ; Switch to SYM-1 address to match checksums
CRLF
        lda #$0a                ; emit LF
        jmp OUTCH

        * = $1E5A
;        * = $8A1B               ; SYM-1
GETCH
        lda $f004               ; read a character from magic I/O location
        cmp #'a'                ; upcase letters for convenience
        bcc +
        cmp #'z'+1
        bcs +
        and #$5f
+
        cmp #$0a                ; is it LF? (which we see for 'enter')
        beq +
        jmp OUTCH               ; echo regular chars (2ksa generates newline)
+
        lda #$0d                ; 2ksa wants CR for end of line
        rts

        * = $1E9E
;        * = $8342               ; SYM-1
OUTSP
        lda #$20                ; emit a space
        jmp OUTCH

        * = $1EA0
;        * = $8A47               ; SYM-1
OUTCH
        sta $f001               ; emit character via magic I/O location
        rts

        .align $1000, 0

