<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="pulseininv"></span>PulseInInv

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PulseInInv pin, user_variable, time units
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `PulseIn` command will monitor the specified pin when the pin is
low, and then measure the low time. It will store the time in the user
variable. The user variable must be a WORD if returned units are
expected to be &gt; 255 (Example: Pulse is 500 ms)

PulseInInv is not recommended for accurate measurement of microsecond
pulses.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 12F629, 4

    Dir GPIO.0 In
    Dim TimeResult as WORD

    Do while GPIO.0 = On        'Wait for next negative edge to start measuring
    Loop

    PulseinInv GPIO.0, TimeResult, ms          ' <<< the PulseInInv instruction
```

<span class="strong">**Key line:**</span>
`PulseinInv GPIO.0, TimeResult, ms` — waits for `GPIO.0` to go high
again, then stores how long it was low, in milliseconds, into
`TimeResult`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="pulsein" class="link" title="PulseIn">PulseIn</a> — related
    command in the same category
-   <a href="pulseout" class="link" title="PulseOut">PulseOut</a> — related
    command in the same category

</div>

</div>
