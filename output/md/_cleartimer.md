<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_cleartimer"></span>ClearTimer

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ClearTimer TimerNo
```

<span class="strong">**Command Availability:**</span>

Available on all Microchip PIC and Atmel AVR microcontrollers with built
in timer modules.

<span class="strong">**Explanation:**</span>

`ClearTimer` is used to clear the specified timer to a value of 0.

`Cleartimer` can be used on-the-fly if desired, so there is no
requirement to stop the timer first.

<span class="strong">**Example:**</span>

``` screen
    .....
    'Clear timer 1
    ClearTimer 1
    .....
```

<span class="strong">**See also,
<a href="_inittimer1.html" class="link" title="InitTimer1">InitTimer1</a>**</span>
article for an example.

</div>
