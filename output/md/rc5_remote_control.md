<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="rc5_remote_control"></span>RC5 Remote Control

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    RC5Send address, data

    RC5High
    RC5Low
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers. Requires the inclusion of the
following:

``` programlisting
    #include <remote.h>
```

<span class="strong">**Explanation:**</span>

`RC5Send` transmits a complete RC5-protocol infrared remote-control
frame: two AGC (automatic gain control) bits, a toggle bit, 5 address
bits, and 6 command bits. `RC5High` and `RC5Low` are the lower-level
biphase (Manchester-style) half-bit routines `RC5Send` uses to transmit
each bit — most programs only need to call `RC5Send`.

This command shares its output pin with `NECSend` (see
<a href="nec_remote_control" class="link" title="NEC Remote Control">NEC Remote Control</a>),
set with:

``` programlisting
    #define RC5Out <pin>
```

The toggle bit is tracked automatically in the global variable
`RC5Toggle`, which increments by one on every call to `RC5Send` — this
is the standard RC5 mechanism a receiver uses to distinguish a genuinely
new button press from a held-down repeat.

`address` uses the low 5 bits of the value passed, and `data` uses the
low 6 bits, matching RC5’s 5-bit address / 6-bit command frame.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F877A, 20

    #define RC5Out PORTB.0
    Dir RC5Out Out

    Do
        RC5Send 0x04, 0x0A          ' <<< the RC5Send instruction
        Wait 100 ms
    Loop
```

<span class="strong">**Key line:**</span>
`RC5Send 0x04, 0x0A` — transmits address `0x04` and command `0x0A` as a
complete RC5 frame, automatically incrementing `RC5Toggle` so a receiver
can tell this transmission apart from a repeat of the previous one.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="nec_remote_control" class="link" title="NEC Remote Control">NEC Remote Control</a> — the
    alternate infrared protocol supported by the same output pin

</div>

</div>
