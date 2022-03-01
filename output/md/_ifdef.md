<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_ifdef"></span>\#ifdef

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #ifdef Constant | Constant Value | Var(VariableName)
      ...
    #endif
```

<span class="strong">**Explanation:**</span>

The `#ifdef` directive is used to selectively enable sections of code.

There are several ways in which it can be used:

<div class="itemizedlist">

-   Checking if a constant is defined  
-   Checking if a constant is defined and has a particular value  
-   Checking if a system variable exists  
-   Checking if a system bit has been defined

</div>

The advantage of using `#ifdef` rather than an equivalent series of `IF`
statements is the amount of code that is downloaded to the chip.
`#ifdef` controls what code is compiled and downloaded, `IF` controls
what is run once on the chip. `#ifdef` should be used whenever the value
of a constant is to be checked.

Great Cow BASIC also supports the `#ifndef` directive - this is the
opposite of the `#ifdef` directive - it will remove code that `#ifdef`
leaves, and vice versa.

<span class="strong">**Note:**</span> The code in the following sections
will not compile, as it is missing `#chip` directives and `Dir`
commands. It is intended to act as an example only.

<span class="strong">**Example 1: <span class="emphasis">*Enabling code
if a constant is defined*</span>**</span>

``` screen
    #define Blink1

    #ifdef Blink1
        PulseOut PORTB.0, 1 sec
        Wait 1 sec
    #endif
    #ifdef Blink2
        PulseOut PORTB.1, 1 sec
        Wait 1 sec
    #endif
```

This code will pulse `PORTB.0`, but not `PORTB.1`. This is because
`Blink1` has been defined, but `Blink2` has not. If the line was added
at the start of the program, then both pins would be pulsed.

``` screen
    #define Blink2
```

The value of the constant defined is not important and can be left off
of the `#define`.

<span class="strong">**Example 2: <span class="emphasis">*Enabling code
if a constant is defined and has a given value*</span>**</span>

``` screen
    #define PinsToFlash 2

    #ifdef PinsToFlash 1,2,3
    PulseOut PORTB.0, 1 sec
    #endif
    #ifdef PinsToFlash 2,3
    PulseOut PORTB.1, 1 sec
    #endif
    #ifdef PinsToFlash 3
    PulseOut PORTB.2, 1 sec
    #endif
```

This program uses a constant called PinsToFlash that controls how many
lights are pulsed. `PORTB.0` is pulsed when `PinsToFlash` is equal to 1,
2 or 3, `PORTB.1` is pulsed when `PinsToFlash` equals 2 or 3, and
`PORTB.2` is flashed when `PinsToFlash` is 3.

<span class="strong">**Example 3: <span class="emphasis">*Enabling code
if a system variable is defined*</span>**</span>

``` screen
    #ifdef NoVar(ANSEL)
    SET ADCON1.PCFG3 OFF
    SET ADCON1.PCFG2 ON
    SET ADCON1.PCFG1 ON
    SET ADCON1.PCFG0 OFF
    #endif
    #ifdef Var(ANSEL)
    ANSEL = 0
    #endif
```

The above section of code has been copied directly from a-d.h. It is
used to disable the A/D function of pins, so that they can be used as
standard digital I/O ports. If `ANSEL` is not declared as a system
variable for a particular chip, then the program uses `ADCON1` to
control the port modes. If `ANSEL` is defined, then the chip is newer
and its ports can be set to digital by clearing `ANSEL`.

<span class="strong">**Example 4: <span class="emphasis">*Enabling code
if a system bit is defined*</span>**</span>

Similar to above, except with `Bit` and `NoBit` in the place of `Var`
and `NoVar` respectively.

<span class="strong">**See Also**</span>
<a href="constants" class="link" title="Constants">Defines</a>,
<a href="_define" class="link" title="#define">#define</a>

</div>
