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
slow in comparison to other GCBASIC commands. Note that it erases memory
in 32-byte blocks - see the relevant Microchip PIC microcontroller
datasheet for more information.

This is an advanced command which should only be used by advanced
developers. Care must be taken with this command, as it can easily erase
the program that is running on the microcontroller.

<span class="strong">**For more help, see
<a href="programread" class="link" title="ProgramRead">ProgramRead</a>**</span>
and <span
class="strong">**<a href="programwrite" class="link" title="ProgramWrite">ProgramWrite</a>**</span>

</div>
