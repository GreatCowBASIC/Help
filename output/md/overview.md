<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="overview"></span>Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

These routines allow GCBASIC to generate pseudo-random numbers.

The generator uses a 16 bit linear feedback shift register to produce
pseudo-random numbers. The most significant 8 bits of the LFSR are used
to provide an 8 bit random number.

When compiling a program, GCBASIC will generate an initial seed for the
generator. However, this seed will be the same every time the program
runs, so the sequence of numbers produced by a given program will always
be the same. To work around this, there is a Randomize subroutine. It
can be provided with a new seed for the generator (which will cause the
generator to move to a different point in the sequence). Alternatively,
Randomize can be set to obtain a seed from some other source such as a
timer every time it is run.

<span class="strong">**Relevant Constants:**</span>

These constants are used to control settings for the random number
generation. To set them, place a line in the main program file that uses
`#define` to assign a value to the particular constant.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span>                             | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:---------------------------------------------------------------------|:----------------------------------------------|
| RANDOMIZE\_SEED                               | Source of the random seed if Randomize is called without a parameter | Timer0                                        |

</div>

<span class="strong">**Example:**</span>

``` screen
    #define RANDOMIZE_SEED Timer2
```

</div>
