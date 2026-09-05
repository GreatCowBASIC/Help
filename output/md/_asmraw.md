<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_asmraw"></span>\#asmraw

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #asmraw [label]
    #asmraw [Mnemonics | Directives | Macros] [Operands] ['comments]
```

for ASM blocks use

``` programlisting
    #asmraw[
        [label]
        [Mnemonics | Directives | Macros] [Operands] ['comments]
    #asmraw]
```

<span class="strong">**Explanation:**</span>

The `#asmraw` directive is used to specify the assembly that GCBASIC
will use.

Anything following this directive will be inserted into the ASM source
file with no changes other than trimming spaces - no replacement of
constants.

  
  
Assembly is a programming language you may use to develop the source
code for your application. The directive must conform to the following
basic guidelines. Each line of the source file may contain up to four
types of information:

<div class="itemizedlist">

-   Labels
-   Mnemonics, Directives, and Macros
-   Operands
-   Comments

</div>

The order and position of these are important. For ease of debugging, it
is recommended that labels start in column one, and mnemonics start in
column two or beyond. Operands follow the mnemonic.

Comments may follow the operands, mnemonics, or labels, and can start in
any column. The maximum column width is 255 characters.

White space or a colon must separate the label and the mnemonic, and
white space must separate the mnemonic and the operand(s). Multiple
operands must be separated by commas.

White space is one or more spaces or tabs. White space is used to
separate pieces of a source line. White space should be used to make
your code easier for people to read.

  
<span class="strong">**Example 1**</span>

``` programlisting
        #asmraw lds SysValueCopy,TCCR0B
        #asmraw andi SysValueCopy, 0xf8
        #asmraw inc SysValueCopy
        #asmraw sts TCCR0B, SysValueCopy          ' <<< a raw assembly instruction inserted unchanged into the ASM output
```

<span class="strong">**Key line:**</span>
`#asmraw sts TCCR0B, SysValueCopy` — this exact text, with only
leading/trailing whitespace trimmed, is written into the generated ASM
file; GCBASIC performs no constant substitution or syntax checking on
it.

<span class="strong">**Example 2**</span>

``` programlisting
        #asmraw[
            lds SysValueCopy,TCCR0B
            andi SysValueCopy, 0xf8
            inc SysValueCopy
            sts TCCR0B, SysValueCopy
        #asmraw]
```

  
This example will generate the following in the ASM source file.

``` programlisting
        lds SysValueCopy,TCCR0B
        andi  SysValueCopy, 0xf8
        inc SysValueCopy
        sts TCCR0B, SysValueCopy
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="compiler_insights" class="link" title="Compiler Insights">Compiler Insights</a> — forcing
    regular (non-raw) assembly comments into the ASM output

</div>

</div>
