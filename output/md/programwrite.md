<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="programwrite"></span>ProgramWrite

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ProgramWrite (location, value)
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC microcontrollers with self write
capability. Not available on Atmel AVR at present.

<span class="strong">**Explanation:**</span>

`ProgramWrite` writes information to the program memory on chips that
support this feature. `location` and `value` are both word variables.

The largest value possible for `location` depends on the amount of
program memory on the microcontroller (see datasheet).

<span class="strong">**The `value` parameter is a word (16-bit), but the
maximum usable value depends on the chip family:**</span> - On <span
class="strong">**PIC18F**</span> family devices: up to <span
class="strong">**65535**</span> (0xFFFF, full 16 bits supported in one
program memory word). - On <span class="strong">**PIC10/PIC12**</span>
(baseline/enhanced)/<span class="strong">**PIC14/PIC16**</span>
families: up to <span class="strong">**16383**</span> (0x3FFF, limited
by 12/14-bit program memory word width).

`ProgramErase` <span class="strong">**must**</span> be used to clear a
block of memory BEFORE `ProgramWrite` is called.

<span class="strong">**Example:**</span>

<span class="strong">**For more help, see
<a href="programerase" class="link" title="ProgramErase">ProgramErase</a>**</span>
and <span
class="strong">**<a href="programread" class="link" title="ProgramRead">ProgramRead</a>**</span>

</div>
