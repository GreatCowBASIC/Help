<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="programread"></span>ProgramRead

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ProgramRead (location, store)

    or for the 18FxxQ41 family of chips use:
    PFMRead (location, store)
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC microcontrollers with self write
capability. Not available on Atmel AVR at present.

<span class="strong">**Explanation:**</span>

`ProgramRead` reads information from the program memory on chips that
support this feature. `location` and `store` are both word variables,
meaning that they can store values over 255.

The largest value possible for `location` depends on the amount of
program memory on the Microchip PIC microcontroller, which is given on
the datasheet. `store` is 14 bits wide, and thus can store values up to
`16383`.

This is an advanced command which should only be used by advanced
developers.

<span class="strong">**Example:**</span>

<span class="strong">**For more help, see
<a href="programerase" class="link" title="ProgramErase">ProgramErase</a>**</span>
and <span
class="strong">**<a href="programwrite" class="link" title="ProgramWrite">ProgramWrite</a>**</span>

</div>
