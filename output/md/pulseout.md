<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="pulseout"></span>PulseOut

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PulseOut pin, time units
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `PulseOut` command will set the specified pin high, wait for the
specified amount of time, and then set the pin low again. The pin is
specified in the same way as it is for the Set command, and the time is
the same as for the `Wait` command.

<span class="strong">**Example:**</span>

``` programlisting
    'This program flashes an LED on GPIO.0 using PulseOut
    #chip 12F629, 4

    'The DIRection of the port is set to show the command.  It is not required to set the DIRection when using the PulseOut command.
    Dir GPIO.0 Out
    Do
        PulseOut GPIO.0, 1 sec 'Turn LED on for 1 sec          ' <<< the PulseOut instruction
        Wait 1 sec             'Wait 1 sec with LED off
    Loop
```

<span class="strong">**Key line:**</span>
`PulseOut GPIO.0, 1 sec` — sets `GPIO.0` high, waits 1 second, then sets
it low again, all within this single statement.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="pulsein" class="link" title="PulseIn">PulseIn</a> — measuring
    the length of an incoming pulse, the counterpart to PulseOut
-   <a href="wait" class="link" title="Wait">Wait</a> — the delay
    command that shares PulseOut’s time-unit syntax
-   <a href="set" class="link" title="Set">Set</a> — setting a
    pin’s state directly without a timed pulse

</div>

</div>
