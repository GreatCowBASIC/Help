<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_volatile"></span>\#Option Volatile

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    #option volatile `bit`
```

This option makes the setting of an output bit glitch-free.

<span class="strong">**Explanation:**</span>

`#option volatile bit`, where `bit` is an I/O bit, like `PORTB.0`,
appended.

When a bit is set from another bit or from a variable, for example
`PORTB.0 = !PORTB.0` or `PORTC.2 = PORTA.1`, the compiler normally
clears the bit and then sets it again if the new value is 1. If the new
value is 1, the output goes low for a few instructions. With
`#option volatile`, the compiler sets the bit only when the new value is
1 and clears it only when the new value is 0, so the output never
changes when it does not need to. This increases code size slightly.

The option has no effect when a bit is set to a constant, for example
`PORTB.0 = 1` or `PORTB.0 = 0`. These are always a single instruction,
so they cannot glitch.

On a chip with `LATx` registers, writes to `PORTx` go to `LATx`. The bit
can be named with either register: `#option volatile PORTC.0` and
`#option volatile LATC.0` both protect writes to `PORTC.0` and to
`LATC.0`. When the `LATx` name is used, the compiler shows an
Information message, for example
`#option Volatile LATC.0 also applied to writes to PORTC.0`.

The option can be used once for each bit that needs it.

<span class="strong">**Example:**</span>

``` programlisting
    'Set chip model
    #chip 16f877a

    'Example command
    #option volatile portb.0          ' <<< marking this pin for glitch-free setting

    dir portb.0 out

    do forever

      portb.0 = !portb.0

    loop
```

<span class="strong">**Key line:**</span>
`#option volatile portb.0` — without this, `portb.0 = !portb.0` clears
bit 0 and then sets it again when the new value is 1, so the output goes
low for an instant; with it, the compiler tests the new value first and
only sets or clears the bit, so the output changes once, cleanly.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_option_nolatch" class="link" title="#Option NoLatch">#Option NoLatch</a> — turns
    off the automatic use of the LATx registers for PORTx writes
-   <a href="_option_shadowregister" class="link" title="#Option Shadowregister">#Option Shadowregister</a> — a
    whole-port shadow-latch alternative on chips without LATx
-   <a href="_define" class="link" title="#DEFINE">#DEFINE</a> — naming
    a pin with a constant, as used with this option

</div>

</div>
