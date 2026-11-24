<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="nec_remote_control"></span>NEC Remote Control

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    NECSend address, data

    NECByte value
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers. Requires the inclusion of the
following:

``` programlisting
    #include <remote.h>
```

<span class="strong">**Explanation:**</span>

`NECSend` transmits a complete NEC-protocol infrared remote-control
frame: a start burst, a sync gap, the address byte, its bitwise
complement, the command byte, and its complement. `NECByte` is the
lower-level routine `NECSend` uses to transmit each of those four bytes
individually — most programs only need to call `NECSend`.

Both this command and `RC5Send` (see
<a href="rc5_remote_control" class="link" title="RC5 Remote Control">RC5 Remote Control</a>)
share the same output pin, set with:

``` programlisting
    #define RC5Out <pin>
```

`address` and `data` are byte values. `NECSend` automatically transmits
each one’s bitwise complement (`!address`, `!data`) immediately
afterward, which is how a NEC receiver detects transmission errors.

Each bit sent by `NECByte` is a short mark burst followed by a space
whose length encodes the bit value — the two space lengths differ so a
receiver can distinguish a 1 from a 0.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F877A, 20

    #define RC5Out PORTB.0
    Dir RC5Out Out

    Do
        NECSend 0x04, 0x0A          ' <<< the NECSend instruction
        Wait 100 ms
    Loop
```

<span class="strong">**Key line:**</span>
`NECSend 0x04, 0x0A` — transmits address `0x04` and command `0x0A` as a
complete NEC frame (address, its complement, command, its complement),
preceded by the standard start burst and sync gap.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="rc5_remote_control" class="link" title="RC5 Remote Control">RC5 Remote Control</a> — the
    alternate infrared protocol supported by the same output pin

</div>

</div>
