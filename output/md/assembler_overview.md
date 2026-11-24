<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="assembler_overview"></span>Assembler Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

You can use microcontroller assembler code within your GCBASIC code.

You can put the assembler code inline with your source code. The
assembler code will be passed through to the assembly file associated
with your project.

GCBASIC should recognise all of the commands in the microcontroller
datasheet.

Commands should be in lower case - this is good practice - and have a
space or tab in front of the command.

Even if the mnemonics are not formatted properly, `gputils`/`MPASM`
should still be capable of assembling the source code.

Format commands as follows:

<span class="strong">**Example:**</span>

``` programlisting
  btfsc STATUS,Z          ' <<< inline assembly checking the Z (zero) status flag
  bsf PORTB,1
```

<span class="strong">**Key line:**</span> `btfsc STATUS,Z` — skips the
following instruction if the Z bit of STATUS is clear, so `bsf PORTB,1`
only executes when the previous operation’s result was zero.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_asmraw" class="link" title="#asmraw">#asmraw</a> — inserting
    assembly with no formatting or trimming at all

</div>

</div>
