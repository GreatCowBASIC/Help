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

You can put the assembler code inline in with your source code. The
assembler code will be passed through to the assembly file associated
with your project.

GCBASIC should recognise all of the commands in the microcontroller
datasheet.

The commands should be in lower case, this is good practice, and have a
space or tab in front of the command.

Even if the mnemonics are not being formatted properly, `gputils/MPASM`
should still be capable of assembling the source code.

Format commands as follows:

<span class="strong">**Example:**</span>

``` screen
  btfsc STATUS,Z
  bsf PORTB,1
```

</div>
