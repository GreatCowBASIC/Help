<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="repeat"></span>Repeat

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Repeat times
    ...
    program code
    ...
    <condition> Exit Repeat
    ...
    End Repeat
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Repeat` command is ideal for situations where a piece of code needs
to be run a set number of times. It uses less memory and runs faster
than the `For` command, and should be used wherever it is not necessary
to count how many times the code has run.

Optionally, you can specify a condition to `Exit` the Repeat-Loop
immediately.

Repeat has a maximum repeat value of 65535.

<span class="strong">**Example:**</span>

``` screen
    'This code will flash a green light 6 times.

    #chip 16F88, 20

    #define LED PORTB.0
    dir LED out

    Repeat 6
    PulseOut LED, 1 s
    Wait 1 s
    End Repeat
```

<span class="strong">**See Also
<a href="for" class="link" title="For">For</a>**</span>

</div>
