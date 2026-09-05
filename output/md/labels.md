<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="labels"></span>Labels

</div>

</div>

</div>

<span class="strong">**About Labels**</span>

Labels are used as markers throughout the program. Labels are used to
mark a position in the program to 'jump to' from another position using
a goto, gosub, or other command.

Labels can be any word (that is not already a reserved keyword) and may
contain digits and the underscore character. Labels must start with a
letter or underscore (not a digit), and are followed directly by a colon
(:) at the marker position. The colon is not required within the actual
commands.

The compiler is not case sensitive. Lower and/or upper case may be used
at any time.

<span class="strong">**Example:**</span>

``` programlisting
    'This program will flash the light until the button is pressed
    'off. Notice the label named SWITCH_OFF.

    #chip 16F628A, 4

    #define BUTTON PORTB.0
    #define LIGHT PORTB.1
    Dir BUTTON In
    Dir LIGHT Out

    Do
    PulseOut LIGHT, 500 ms
    If BUTTON = 1 Then Goto SWITCH_OFF          ' <<< jumping to a label
    Wait 500 ms
    If BUTTON = 1 Then Goto SWITCH_OFF
    Loop

    SWITCH_OFF:
    Set LIGHT Off
    'Chip will enter low power mode when program ends
```

<span class="strong">**Key line:**</span>
`If BUTTON = 1 Then Goto SWITCH_OFF` — as soon as the button is read as
pressed, execution jumps straight to the `SWITCH_OFF:` label below,
skipping the rest of the loop body and turning the light off.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="goto" class="link" title="Goto">Goto</a> — unconditional
    jump to a label
-   <a href="gosub" class="link" title="Gosub">Gosub</a> — calling
    a label as a subroutine

</div>

</div>
