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

The `Goto` command will make the microcontroller jump to the line
specified, and continue running the program from there. The `Goto`
command is mainly useful for exiting out of loops - if you need to
create an infinite loop, use the `Do` command instead.

Be careful how you use `Goto`. If used too much, it can make programs
very hard to read.

To define a label, put the name of the label alone on a line, with just
a colon (:) after it.

<span class="strong">**Example:**</span>

``` screen
    'This program will flash the light until the button is pressed
    'off. Notice the label named SWITCH_OFF.

    #chip 16F628A, 4 'Change this line to suit your circuit

    #define BUTTON PORTB.0
    #define LIGHT PORTB.1
    Dir BUTTON In
    Dir LIGHT Out

    Do
        PulseOut LIGHT, 500 ms
        If BUTTON = 1 Then Goto SWITCH_OFF
        Wait 500 ms
        If BUTTON = 1 Then Goto SWITCH_OFF
    Loop

    SWITCH_OFF:
    Set LIGHT Off
    'Chip will enter low power mode when program ends
```

<span class="strong">**For more help, see
<a href="gosub" class="link" title="Gosub">Gosub</a>**</span> and
<span
class="strong">**<a href="labels" class="link" title="Labels">Labels</a>**</span>

</div>
