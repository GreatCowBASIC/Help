<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="set"></span>Set

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Set variable.bit {On | Off}
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The purpose of the Set command is to turn individuals bits on and off.

The Set command is most useful for controlling output ports, but can
also be used to set variables.

Often when controlling output ports, Set is used in conjunction with
constants. This makes it easier to adapt the program for a new circuit
later.

<span class="strong">**Example:**</span>

``` screen
    'Blink LED sample program for GCBASIC
    'Controls an LED on PORTB bit 0.

    'Set chip model and config options
    #chip 16F84A, 20

    'Set a constant to represent the output port
    #define LED PORTB.0

    'Set pin direction
    Dir LED Out

    'Main routine
    Do
        Set LED On
        Wait 1 sec
        Set LED OFF
        Wait 1 sec
    Loop
```

</div>
