<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="more_on_setting_variables_and_constants"></span>More on setting Variables and Constants

</div>

</div>

</div>

<span class="strong">**Explanation**</span>

Within GCBASIC you can use regular variable assignments. But, you can
also use C like maths assignments.

The following methods are also supported.

``` programlisting
    GLCDPrintLoc += 6
    CharCode -= 15
    CharCode++
    CharCode---          ' <<< the decrement operator
```

<span class="strong">**Key line:**</span> `CharCode---` — decrements
`CharCode` by 1. GCBASIC uses three dashes here, not two, because `--`
inside an expression already means double-negation (equivalent to `+`);
the extra dash disambiguates the decrement statement from that
expression rule.

Within GCBASIC you can define binary, hexidecimal and decimal constants,
see
<a href="constants" class="link" title="Constants">Constants</a>.
Please note what is and what is not support with respect to assigning
numbers to constants. An example program examines what is supported.

``` programlisting
    #chip 16F88, 4
    #config Osc = MCLRE_OFF

    ' All these work
    #define Test1 0b11111111
    #define Test2 0B11111111
    #define Test3 255
    #define Test4 0xFF
    #define Test5 0xff
    #define Test6 0Xff

    # Proof - select each option one in turn
    dir porta Out

    porta = test1          ' <<< all six constants below resolve to the same value, 255
    porta = test2
    porta = test3
    porta = test4
    porta = test5
    porta = test6
```

<span class="strong">**Key line:**</span> `porta = test1` — all six
lines assign the identical value, 255, to `porta`; `Test1`/`Test2` show
that binary literals accept either case of `b` prefix, and
`Test4`/`Test5`/`Test6` show the same for hexadecimal, confirming
GCBASIC’s numeric literal prefixes are case-insensitive.

You can assigned values/numbers with all the methods shown above (for
constants and variables) but please be aware that you must Use '0' not
'00'. One zero equates to zero and two zeros will give you an unassigned
variable.

<span class="strong">**Constants:**</span>

A few critical constants are defined within GCBASIC , you can re-use
these constants. They include:

``` programlisting
    #define ON 1       ' These are defined in System.h
    #define OFF 0
    #define TRUE 255
    #define FALSE 0

    #define OSC = 1    ' These are defined in TIMER.H
    #define EXT = 2    ' and, are used by InitTimer0 command
    #define EXTOSC = 3
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="constants" class="link" title="Constants">Constants</a>
-   <a href="setting_variables" class="link" title="Setting Variables">Setting Variables</a> — the
    assignment and calculation rules these shorthand operators build on
-   <a href="inittimer0" class="link" title="InitTimer0">InitTimer0</a> — using
    the OSC/EXT/EXTOSC clock source constants shown above

</div>

</div>
