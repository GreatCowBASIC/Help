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

Available on all Microchip PIC microcontrollers with self write
capability. Not available on Atmel AVR at present.

<span class="strong">**Explanation:**</span>

`ProgramErase` erases information from the program memory on chips that
support this feature. The largest value possible for `location` depends
on the amount of program memory on the Microchip PIC microcontroller,
which is given on the datasheet.

This command must be called before writing to a block of memory. It is
slow in comparison to other GCBASIC commands.

<span class="strong">**Note that it erases memory in blocks/pages — the
size varies by device:**</span> - Many classic <span
class="strong">**PIC18F**</span> devices: typically 64 bytes (32 words)
per erase row. - Newer <span class="strong">**PIC18 Q-series**</span>
(e.g., PIC18FxxQ43, PIC18FxxQ84): typically <span class="strong">**256
bytes (128 words)**</span> per erase page. - Other sizes exist on some
models (e.g., 512 bytes or larger on certain variants).

<span class="strong">**Always consult the relevant Microchip PIC
microcontroller datasheet**</span> for the exact erase page/row size,
required alignment (usually multiples of the page size), and any
restrictions on self-write/erase operations (e.g., unlock sequences, row
vs. page erase).

Care must be taken with this command, as it can easily erase the program
that is running on the microcontroller.

<span class="strong">**For more help, see
<a href="programread" class="link" title="ProgramRead">ProgramRead</a>**</span>
and <span
class="strong">**<a href="programwrite" class="link" title="ProgramWrite">ProgramWrite</a>**</span>

</div>
