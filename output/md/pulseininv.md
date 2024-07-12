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

``` screen
    #chip 12F629, 4

    Dir GPIO.0 In
    Dim TimeResult as WORD

    Do while GPIO.0 = On        'Wait for next negative edge to start measuring
    Loop

    PulseinInv GPIO.0, TimeResult, ms
```

</div>
