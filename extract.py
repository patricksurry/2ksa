import re


sym_re = '[-?A-Z][A-Z0-9]+'
addr_re = '[0-9A-F]{4}'
byte_re = '[0-9A-F]{2}'


def fixsym(s: str) -> str:
    """Translate non-alpha prefix to get a legal symbol"""
    return ({'-': 'X', '?': 'Q'}).get(s[0], s[0]) + s[1:]


def convert_module(s: str, globals: set) -> str:
    m = re.search(rf'####? ({addr_re})\s.*?({sym_re})', s)
    if m:
        addr = m.group(1)
        name = fixsym(m.group(2))
        if name in globals:
            k = 2
            while True:
                s = f"{name}{k}"
                if s not in globals:
                    break
                k += 1
            name = s
        globals.add(name)
        return f"{name: <8s}; ${addr}"

    if s.startswith('```asmx'):
        return '\n'.join(['.comment'] + s.splitlines()[1:-1] + ['.endcomment'])

    if s.startswith('```64tass'):
        return '\n'.join(s.splitlines()[1:-1])

    lines = s[6:-3].splitlines()
    locals = set()
    err = False
    for line in lines:
        try:
            convert_line(line, locals)
        except:
            err = True
            print('Failed to convert', line)
    if err:
        return ''
    return '\n'.join(convert_line(line, locals) for line in lines) + '\n'


def convert_line(line, locals: set):
    if not line.strip():
        # blank line
        return line
    elif m := re.match(rf'{addr_re}((?:\s+{byte_re})+)$', line):
        # data table
        bytes = m.group(1).strip().split()
        return '    .byte ' + ', '.join(f'${b}' for b in bytes)
    elif m := re.match(rf'({sym_re})\s+({addr_re})\s+(.*)', line):
        # global symbol assignment
        return f"{m.group(1): <8s}= ${m.group(2)} " + 16*' ' + '; ' + m.group(3)

    # module line with label? op param[mod?] comment?
    # any labels defined here are locals
    splits = [0, 8, 16, 19, 24, 40, None]
    blank, label, opcode, mode, param, comment = [
        line[start:end].strip() for (start, end) in zip(splits[:-1], splits[1:])
    ]
    if blank or not opcode:
        return f'UNPARSED: {line}'

    if ' ' in param:
        param, modifier = param.split()
    else:
        modifier = None
    if param in locals:
        param = f"_{param}"
    elif param:
        param = fixsym(param)

    if modifier:
        param = f"{param}+${modifier}"

    if label:
        locals.add(label)
        label = f"_{label}"

    if comment:
        comment = '; ' + comment
    match mode:
        case '' | 'Z':
            pass
        case '#':
            param = f'#${param}'
        case 'A':
            pass
        case 'X' | 'ZX':
            param = f'{param},x'
        case 'Y':
            param = f'{param},y'
        case 'I':
            param = f'({param})'
        case 'IX':
            param = f'({param},x)'
        case 'IY':
            param = f'({param}),y'
        case _:
            raise ValueError(f"Unknown mode {mode}")
    return f"{label: <8s}{opcode: <8s}{param: <16s}{comment}"

doc = open('2ksa.md').read()

literate = doc.split('## APPENDIX')[0]

modules = re.findall(r'(?:```(?:asmx?|64tass)\n.*?```)|(?:####? [0-9A-F]{4}.*?\n)', literate, re.DOTALL)

globals = set()
print("* = $200")
print('\n'.join(convert_module(m, globals) for m in modules))

