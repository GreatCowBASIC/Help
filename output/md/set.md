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

``` programlisting
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
        Set LED On          ' <<< the Set instruction
        Wait 1 sec
        Set LED OFF
        Wait 1 sec
    Loop
```

<span class="strong">**Key line:**</span> `Set LED On` — drives the
`LED` bit (aliased to `PORTB.0`) high; using the `LED` constant instead
of writing `PORTB.0` directly means only the `#define` line needs to
change if the circuit moves to a different pin.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="using_variables" class="link" title="Using Variables">Using Variables</a> — related
    command in the same category
-   <a href="more_on_setting_variables_and_constants" class="link" title="More on setting Variables and Constants">More on setting Variables and Constants</a> — related
    command in the same category
-   <a href="dir" class="link" title="Dir">Dir</a> — setting the
    pin direction before using Set, as used above

</div>

</div>
