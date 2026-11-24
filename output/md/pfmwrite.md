<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="pfmwrite"></span>PFMWrite

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PFMWrite (location, value)
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC microcontrollers with PFM (Program Flash
Memory) self-write capability, such as the 18FxxQ41 family.

<span class="strong">**Explanation:**</span>

`PFMWrite` writes information to the program memory on chips that
support this feature. `location` is a word variable identifying the word
to write, and `value` is the word value to store there.

The largest value possible for `location` depends on the amount of
program memory on the microcontroller.

This is an advanced command intended for developers who need direct
control over program-memory self-write operations; most programs should
use <a href="data" class="link" title="DATA">DATA</a> blocks
instead. As with `ProgramWrite`, the target row must normally be erased
before it can be written — consult the chip’s datasheet for the row size
and any required unlock sequence.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 18F56Q43, 64

    Dim WordLocation As Word

    WordLocation = 0x1000

    PFMWrite ( WordLocation, 0x1234 )          ' <<< the PFMWrite instruction
```

<span class="strong">**Key line:**</span>
`PFMWrite ( WordLocation, 0x1234 )` — stores the 16-bit value `0x1234`
at the program-memory word addressed by `WordLocation`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="pfmread" class="link" title="PFMRead">PFMRead</a> — reading
    back the value this page writes
-   <a href="programwrite" class="link" title="ProgramWrite">ProgramWrite</a> — the
    equivalent command on chip families that do not use the PFM naming
-   <a href="data" class="link" title="DATA">DATA</a> — defining a
    program-memory dataset instead of writing individual words

</div>

</div>
