<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="programerase"></span>ProgramErase

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ProgramErase (location)
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC microcontrollers with self-write
capability. Not currently available on Atmel AVR.

<span class="strong">**Explanation:**</span>

`ProgramErase` erases information from the program memory on chips that
support this feature. The largest value possible for `location` depends
on the amount of program memory on the Microchip PIC microcontroller,
given in the datasheet.

This command must be called before writing to a block of memory. It is
slow in comparison to other GCBASIC commands.

<span class="strong">**Note that it erases memory in blocks/pages — the
size varies by device:**</span> - Many classic <span
class="strong">**PIC18F**</span> devices: typically 64 bytes (32 words)
per erase row. - Newer <span class="strong">**PIC18 Q-series**</span>
(e.g., PIC18FxxQ43, PIC18FxxQ84): typically <span class="strong">**256
bytes (128 words)**</span> per erase page. - Other sizes exist on some
models (e.g., 512 bytes or larger on certain variants).

<span class="strong">**Always consult the relevant Microchip PIC
microcontroller datasheet**</span> for the exact erase page/row size,
the required alignment (usually a multiple of the page size), and any
restrictions on self-write/erase operations (for example, unlock
sequences, or row versus page erase).

Care must be taken with this command, since it can easily erase the
program that is running on the microcontroller.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 18F26K22, 16

    Dim EraseLocation As Word
    EraseLocation = 0x1000

    ProgramErase ( EraseLocation )          ' <<< the ProgramErase instruction
    ProgramWrite ( EraseLocation, 1234 )
```

<span class="strong">**Key line:**</span>
`ProgramErase ( EraseLocation )` — erases the entire row containing
`EraseLocation` before `ProgramWrite` stores a new value there; skipping
this step on most PIC self-write hardware leaves the old bits
un-overwritable.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="programread" class="link" title="ProgramRead">ProgramRead</a> — reading
    program memory
-   <a href="programwrite" class="link" title="ProgramWrite">ProgramWrite</a> — writing
    program memory after erasing it
-   <a href="data" class="link" title="DATA">DATA</a> — defining
    fixed data instead of writing it at run time

</div>

</div>
