<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="for"></span>For

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    For counter = start To end [Step increment]
    ...
    program code
    ...
    <condition> Exit For
    ...
    Next
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The For command is ideal for situations where a piece of code needs to
be run a set number of times, and where it is necessary to keep track of
how many times the code has run. When the For command is first executed,
`counter` is set to `start`. Then, each successive time the program
loops, `increment` is added to `counter`, until `counter` is equal to
`end`. Then, the program continues beyond the Next.

`Step` and `increment` are optionals. If Step is not specified, GCBASIC
will increment `counter` by 1 each time the code is run.

Step is an integer value.  Step value can positive of negative.  When
using advanced variable you must cast the step value as an integer, see
the example below.

`increment` can be a positive or negative constant or an integer.

The `Exit For` is optional and can be used to exit the loop upon a
specific condition.

<div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;">

### Warning

`#define USELEGACYFORNEXT` to enable legacy FOR-NEXT support.   The
GCBASIC compiler was revised in 2021 to improve the handling of the
FOR-NEXT support.   You can revert to the legacy FOR-NEXT support by
using `#DEFINE USELEGACYFORNEXT` but using this legacy support will
cause your program to operate incorrectly.    The use of
`#DEFINE USELEGACYFORNEXT` is NOT recommended.

</div>

<span class="strong">**Examples.**</span>

<span class="strong">**Example 1:**</span>

``` screen
    'This code will flash a green light 6 times.

    #chip 16F88, 8

    #define LED PORTB.0
    Dir LED Out

    For LoopCounter = 1 to 6

      PulseOut Led, 1 s
      Wait 1 s

    Next
```

<span class="strong">**Example 2:**</span>

``` screen
'This code will flash alternate LEDS until the switch is pressed.

    #chip 16F88, 8

    #define LED1 PORTB.0
    Dir LED1 Out
    #define LED2 PORTB.2
    Dir LED2 Out

    #define SWITCH1 PORTA.0
    Dir SWITCH1 In
    main:
    PulseOut LED1, 1 s
    For LoopCounterOut = 1 to 250

      PulseOut LED2, 4 Ms
      if switch = On then Exit For

    Next
    Set LED2 OFF
    goto main
```

<span class="strong">**Example 3:**</span>

This example show casting the step value as an integer.  The step value
in this example is the integer value of 2.

``` screen
    #script
        // Create a constant
        Pi = 22/7
    #endscript

    Dim myCircumference, myRadius as Single
    Dim myDiameter as Single Alias myCircumference_E, myCircumference_U, myCircumference_H, myCircumference

    HserPrintCRLF

    For MyRadius = 0.5 to 10.5 step [integer]2
        myCircumference=myRadius * Pi * 2
        HSerPrint "myRadius = " + ltrim(SingleToString(myRadius))
        HSerPrintStringCRLF " myCircumference = " + ltrim(SingleToString(myCircumference))
    next
```

<span class="strong">**For more help, see
<a href="repeat" class="link" title="Repeat">Repeat</a>**</span>

</div>
