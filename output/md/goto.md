<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="goto"></span>Goto

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Goto label
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Goto` command makes the microcontroller jump to the line specified,
and continue running the program from there. It is mainly useful for
exiting out of loops — if you need to create an infinite loop, use the
`Do` command instead.

Be careful how you use `Goto`. If used too much, it can make programs
very hard to read.

To define a label, put the name of the label alone on a line, followed
by a colon (`:`).

<span class="strong">**Example:**</span>

``` programlisting
    'This program will flash the light until the button is pressed
    'off. Notice the label named SWITCH_OFF.

    #chip 16F628A, 4 'Change this line to suit your circuit

    #define BUTTON PORTB.0
    #define LIGHT PORTB.1
    Dir BUTTON In
    Dir LIGHT Out

    Do
        PulseOut LIGHT, 500 ms
        If BUTTON = 1 Then Goto SWITCH_OFF          ' <<< the Goto instruction
        Wait 500 ms
        If BUTTON = 1 Then Goto SWITCH_OFF
    Loop

    SWITCH_OFF:
    Set LIGHT Off
    'Chip will enter low power mode when program ends
```

<span class="strong">**Key line:**</span> `Goto SWITCH_OFF` — jumps
straight to the `SWITCH_OFF:` label the moment the button is pressed,
breaking out of the surrounding `Do`/`Loop` without waiting for it to
finish its current pass.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="gosub" class="link" title="Gosub">Gosub</a> — a jump
    that can `Return` back afterwards
-   <a href="labels" class="link" title="Labels">Labels</a> — defining
    the target a `Goto` jumps to, as `SWITCH_OFF:` does above
-   <a href="do" class="link" title="Do">Do</a> — the preferred
    way to build an infinite loop instead of looping with `Goto`

</div>

</div>
