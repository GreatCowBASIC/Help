<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="repeat"></span>Repeat

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Repeat times
    ...
    program code
    ...
    <condition> Exit Repeat
    ...
    End Repeat
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Repeat` command is ideal for situations where a piece of code needs
to run a set number of times. It uses less memory and runs faster than
the `For` command, and should be used whenever it is not necessary to
count how many times the code has run.

Optionally, you can specify a condition to `Exit Repeat` immediately.

`Repeat` has a maximum repeat value of 65535.

<span class="strong">**Example:**</span>

``` programlisting
    'This code will flash a green light 6 times.

    #chip 16F88, 20

    #define LED PORTB.0
    dir LED out

    Repeat 6          ' <<< the Repeat instruction
    PulseOut LED, 1 s
    Wait 1 s
    End Repeat
```

<span class="strong">**Key line:**</span> `Repeat 6` — runs the two
lines between it and `End Repeat` exactly six times, without needing a
loop-counter variable the way `For` would.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="for" class="link" title="For">For</a> — a counted
    loop that also exposes the current iteration number
-   <a href="do" class="link" title="Do">Do</a> — an unbounded
    loop, for when the iteration count is not known in advance

</div>

</div>
