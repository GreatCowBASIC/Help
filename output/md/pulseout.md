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

``` screen
    'This program flashes an LED on GPIO.0 using PulseOut
    #chip 12F629, 4

    'The DIRection of the port is set to show the command.  It is not required to set the DIRection when using the PulseOut command.
    Dir GPIO.0 Out
    Do
        PulseOut GPIO.0, 1 sec 'Turn LED on for 1 sec
        Wait 1 sec             'Wait 1 sec with LED off
    Loop
```

</div>
