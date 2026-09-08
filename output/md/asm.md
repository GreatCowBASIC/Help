<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="asm"></span>Asm

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Asm [label]
    Asm [Mnemonics | Directives | Macros] [Operands] ['comments]
```

<span class="strong">**Explanation:**</span>

`Asm` inserts a single line of raw assembly into the generated ASM
source, in the same way as
<a href="_asmraw" class="link" title="#asmraw">#asmraw</a> - but
with one key difference: `Asm` first replaces any GCBASIC constant (from
`#define`, `#script`, or a system constant) found on the line with its
value, exactly as it would in ordinary GCBASIC source. `#asmraw` does
not do this - it inserts the line completely unchanged, with only
leading/trailing whitespace trimmed.

Use `Asm` whenever the assembly line needs to reference a
GCBASIC-defined constant. Use `#asmraw` when the line must be passed to
the assembler exactly as written, with no substitution.

  
  

<span class="strong">**Example**</span>

``` programlisting
    #define MY_DELAY_COUNT 200

    Asm movlw MY_DELAY_COUNT          ' <<< MY_DELAY_COUNT is replaced with 200 before this line reaches the assembler
    #asmraw movlw MY_DELAY_COUNT      ' <<< inserted unchanged; the assembler will not recognize MY_DELAY_COUNT
```

<span class="strong">**Key line:**</span>
`Asm movlw MY_DELAY_COUNT` — because this is `Asm`, not `#asmraw`,
GCBASIC substitutes the constant’s value before writing the line,
producing `movlw 200` in the ASM output; the `#asmraw` line below it is
written out verbatim and will fail to assemble.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_asmraw" class="link" title="#asmraw">#asmraw</a> — the
    equivalent directive that inserts a line with no constant
    substitution
-   <a href="compiler_insights" class="link" title="Compiler Insights">Compiler Insights</a> — forcing
    regular (non-raw) assembly comments into the ASM output

</div>

</div>
