<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="randomize"></span>Randomize

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Randomize
    Randomize seed
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

Randomize is used to seed the pseudo random number generator, so that it
will produce a different sequence of numbers each time it is used.

The random number generator in GCBASIC is a 16 bit linear feedback shift
register, which is explained here:
<http://en.wikipedia.org/wiki/Linear_feedback_shift_register>

Generally, you will get the same sequence every time it is
used.  However, you can seed it so that it will start at a different
point at the sequence using the Randomize command.

If you wanted to use an analog reading to seed the generator, this would
work:

``` literallayout
Randomize ReadAD10(AN0)
```

If no <span class="emphasis">*seed*</span> is specified, then the
RANDOMIZE\_SEED constant will be used as the seed.  If <span
class="emphasis">*seed*</span> is specified, then it will be used to
seed the generator.

It is important that the seed is different every time that Randomize is
used. If the seed is always the same, then the sequence of numbers will
always be the same.   It is best to use a running timer, an input port,
or the analog to digital converter as the source of the seed, since
these will normally provide a different value each time the program
runs.

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip tiny2313, 1

    'Use randomize, with the value on PORTD as the seed
    Randomize PORTD

    'Generate random numbers, and output on PORTB
    Do
        PORTB = Random
        Wait 1 s
    Loop
```

</div>
