<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="cleartimer"></span>ClearTimer

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

``` programlisting
    .....
    'Clear timer 1
    ClearTimer 1          ' <<< the ClearTimer instruction
    .....
```

<span class="strong">**Key line:**</span> `ClearTimer 1` — resets Timer
1’s count to 0 immediately, whether or not the timer is currently
running.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="inittimer1" class="link" title="InitTimer1">InitTimer1</a> — a
    full worked example that uses ClearTimer before timing an event
-   <a href="starttimer" class="link" title="StartTimer">StartTimer</a>
    /
    <a href="stoptimer" class="link" title="StopTimer">StopTimer</a> — starting
    and stopping the timer being cleared
-   <a href="settimer" class="link" title="Settimer">Settimer</a> — setting
    a timer to a specific value instead of clearing it to 0

</div>

</div>
