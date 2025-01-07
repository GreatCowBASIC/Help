<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_gosub"></span>Gosub

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Gosub label
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Gosub` command is used to jump to a label as a subroutine, in a
similar way to `Goto`. The difference is that `Return` can then be used
to return to the line of code after the `Goto`.

<span class="strong">**NOTE**</span>

`Gosub` should NOT be used if it can be avoided. It is not required to
call a subroutine that has been defined using
<a href="_subroutines.html" class="link" title="Subroutines">Sub</a>,
just write the name of the subroutine.

<span class="strong">**Example:**</span>

``` screen
    'This program will flash an LED on portb bit 0 and play a beep on
    'porta bit 4. until the microcontroller is turned off.

    #chip 16F628A, 4 'Change this to suit your circuit

    #define SOUNDOUT PORTA.4
    #define LIGHT PORTB.0
    Dir LIGHT Out

    Do
        'Flash Light
        PulseOut LIGHT, 1 s
        Wait 1 s
        'Beep
        Gosub PlayBeep
    Loop

    PlayBeep:
    Tone 200, 10
    Tone 100, 10
    Return
```

<span class="strong">**For more help, see
<a href="_goto.html" class="link" title="Goto">Goto</a>**</span> and
<span
class="strong">**<a href="_labels.html" class="link" title="Labels">Labels</a>**</span>

</div>
