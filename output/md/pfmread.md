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

Available on all Microchip PIC microcontrollers with PFM self write
capability.

<span class="strong">**Explanation:**</span>

`PFMRead` reads information from the program memory on chips that
support this feature. `location` is a word variable, and `store` can be
a byte of word.

The largest value possible for `location` depends on the amount of
program memory on the Microchip PIC microcontroller.

This is an advanced command which should only be used by advanced
developers.

<span class="strong">**For more help, see
<a href="pfmwrite" class="link" title="PFMWrite">PFMWrite</a>**</span>

</div>
