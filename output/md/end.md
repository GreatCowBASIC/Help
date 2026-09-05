<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="end"></span>End

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    End
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

When the `End` command is used, the program will immediately stop
running. There are very few cases where this command is
needed — generally, the program should be an endless loop.

<span class="strong">**Example:**</span>

``` programlisting
    'This program will turn on the red light, but not the green light
    Set RED On
    End          ' <<< the End instruction
    Set GREEN On
```

<span class="strong">**Key line:**</span> `End` — halts the program
immediately after `RED` is switched on, so the following `Set GREEN On`
line is never reached.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="do" class="link" title="Do">Do</a> — the endless-loop
    pattern most GCBASIC programs use instead of ending
-   <a href="exit" class="link" title="Exit">Exit</a> — exiting
    the current routine without stopping the whole program

</div>

</div>
