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

Available on all Microchip PIC microcontrollers with PFM self write
capability.

<span class="strong">**Explanation:**</span>

`PFMWrite` writes information to the program memory on chips that
support this feature. `location` is a word variable, and `store` can be
a byte of word.

The largest value possible for `location` depends on the amount of
program memory on the microcontroller.

This is an advanced command which should only be used by advanced
developers.

<span class="strong">**Example:**</span>

<span class="strong">**For more help, see
\*<a href="pfmread" class="link" title="PFMRead">PFMRead</a>**</span>

</div>
