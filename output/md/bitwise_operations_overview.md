<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="bitwise_operations_overview"></span>Bitwise Operations Overview

</div>

</div>

</div>

<span class="strong">**About Bitwise Operations**</span>

GCBASIC (as with most other microcontroller programming languages)
supports bitwise operations.

Bitwise operations are performed on one or more bit patterns at the
level of their individual bits.

GCBASIC supports the following methods.

<div class="informaltable">

| <span class="strong">**Method**</span> | <span class="strong">**Meaning**</span>                                                                                                                           |
|:---------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Set                                    | Assigns a Bit value of On or Off                                                                                                                                  |
| SetWith                                | Evaluates an expression and assigns the result                                                                                                                    |
| Rotate                                 | Performs a rotation of a variable of one bit in a specified direction                                                                                             |
| Shift                                  | Performs a logical shift of a variable of one bit in a specified direction, shifting in a 0. Faster than FnLSL and FnLSR for a shift of one place or a few places |
| FnLSL                                  | Performs a Bitwise LEFT shift by any number of places. For one place, or a few, Shift is faster                                                                   |
| FnLSR                                  | Performs a Bitwise RIGHT shift by any number of places. For one place, or a few, Shift is faster                                                                  |

</div>

<span class="strong">**For more help, see:
<a href="set" class="link" title="Set">Set</a>,
<a href="setwith" class="link" title="SetWith">SetWith</a>,
<a href="rotate" class="link" title="Rotate">Rotate</a>,
<a href="shift" class="link" title="Shift">Shift</a>,
<a href="fnlsl" class="link" title="FnLSL">FnLSL</a> and
<a href="fnlsr" class="link" title="FnLSR">FnLSR</a>**</span>

</div>
