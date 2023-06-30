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
program memory on the microcontroller , which is given on the datasheet.
`value` is 14 bits wide, and thus can store values up to 16383.

This is an advanced command which should only be used by advanced
developers. ProgramErase must be used to clear a block of memory BEFORE
`ProgramWrite` is called.

<span class="strong">**Example:**</span>

<span class="strong">**For more help, see
<a href="programerase" class="link" title="ProgramErase">ProgramErase</a>**</span>
and <span
class="strong">**<a href="programread" class="link" title="ProgramRead">ProgramRead</a>**</span>

</div>
