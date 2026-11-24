<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="pfmread"></span>PFMRead

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PFMRead (location, store)
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC microcontrollers with PFM (Program Flash
Memory) self-write capability, such as the 18FxxQ41 family.

<span class="strong">**Explanation:**</span>

`PFMRead` reads information from the program memory on chips that
support this feature. `location` is a word variable identifying the word
to read, and `store` can be a byte or word variable to receive the
result.

The largest value possible for `location` depends on the amount of
program memory on the Microchip PIC microcontroller.

This is an advanced command intended for developers who need direct
control over program-memory self-read operations; most programs should
use <a href="data" class="link" title="DATA">DATA</a> blocks and
`ProgramRead` instead.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 18F56Q43, 64

    Dim WordLocation As Word
    Dim StoredValue As Word

    WordLocation = 0x1000

    PFMRead ( WordLocation, StoredValue )          ' <<< the PFMRead instruction

    HSerPrint StoredValue
```

<span class="strong">**Key line:**</span>
`PFMRead ( WordLocation, StoredValue )` — reads the program-memory word
at `WordLocation` back into `StoredValue`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="pfmwrite" class="link" title="PFMWrite">PFMWrite</a> — writing
    the value this page reads back
-   <a href="programread" class="link" title="ProgramRead">ProgramRead</a> — the
    equivalent command on chip families that do not use the PFM naming
-   <a href="data" class="link" title="DATA">DATA</a> — defining a
    program-memory dataset to read with this command

</div>

</div>
