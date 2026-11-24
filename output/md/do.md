<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="do"></span>Do

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Do [{While | Until} condition]
    ...
    program code
    ...
    <condition> Exit Do
    ...
    Loop [{While | Until} condition]
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Do` command will cause the code between the `Do` and the `Loop` to
run repeatedly while `condition` is true or until `condition` is true,
depending on whether `While` or `Until` has been specified.

Note that the `While` or `Until` and the condition can only be specified
once, or not at all. If they are not specified, then the code will
repeat endlessly.

Optionally, you can specify a condition to `EXIT` the `Do-Loop`
immediately.

<span class="strong">**Example 1:**</span>

``` programlisting
    'This code will flash a light until the button is pressed
    #chip 12F629, 4

    #define BUTTON GPIO.3
    #define LIGHT GPIO.5

    Dir BUTTON In
    Dir LIGHT Out

    Do Until BUTTON = 1          ' <<< the Do...Loop this page documents
      PulseOut LIGHT, 1 s
      Wait 1 s
    Loop
```

<span class="strong">**Key line:**</span> `Do Until BUTTON = 1` — the
loop body repeats until `BUTTON` becomes true; with `Until` the test
happens <span class="strong">**before**</span> each pass.

<span class="strong">**Example 2:**</span>

This code will also flash a light until the button is pressed. This
example uses `EXIT DO` within a continuous loop.

``` screen
    #chip 12F629, 4

    #define BUTTON GPIO.3
    #define LIGHT GPIO.5

    Dir BUTTON In
    Dir LIGHT Out

    Do
      PulseOut LIGHT, 1 s
      Wait 1 s
      if BUTTON = 1 then EXIT DO
    Loop
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="conditions" class="link" title="Conditions">Conditions</a> — background
    on how conditions are evaluated
-   <a href="for" class="link" title="For">For</a> — fixed-count
    loop alternative when the number of iterations is known
-   <a href="if" class="link" title="If">If</a> — conditional
    execution without looping
-   <a href="pulseout" class="link" title="PulseOut">PulseOut</a> — generating
    a timed pulse, as used in the example above
-   <a href="wait" class="link" title="Wait">Wait</a> — introducing
    a fixed delay, as used in the example above

</div>

</div>
