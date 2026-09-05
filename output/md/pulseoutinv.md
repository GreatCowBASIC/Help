<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="pulseoutinv"></span>PulseOutInv

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PulseOutInv pin, time units
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `PulseOutInv` command will set the specified pin low, wait for the
specified amount of time, and then set the pin high. The pin is
specified in the same way as it is for the `Set` command, and the time
is the same as for the `Wait` command.

<span class="strong">**Example:**</span>

``` programlisting
    'This program flashes an LED on GPIO.0 using PulseOutInv
    #chip 12F629, 4

    Dir GPIO.0 Out
    Do
        PulseOutInv GPIO.0, 1 sec     'Turn LED off for 1 sec          ' <<< the PulseOutInv instruction
        Wait 1 sec                    'Wait 1 sec with LED on
    Loop
```

<span class="strong">**Key line:**</span>
`PulseOutInv GPIO.0, 1 sec` — sets `GPIO.0` low, waits 1 second, then
sets it high again — the opposite polarity to `PulseOut`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="pulseout" class="link" title="PulseOut">PulseOut</a> — related
    command in the same category
-   <a href="pulsein" class="link" title="PulseIn">PulseIn</a> — related
    command in the same category

</div>

</div>
