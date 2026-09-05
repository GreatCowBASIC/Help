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

This option ensures port settings are glitch-free.

<span class="strong">**Explanation:**</span>

`#option volatile bit`, where `bit` is an I/O bit, like `PORTB.0`,
appended.

This will cause the compiler to set the bit without any glitches when
copying a value from another variable, but will increase code size
slightly.

<span class="strong">**Example:**</span>

``` programlisting
    'Set chip model
    #chip 16f877a

    'Example command
    #option volatile portb.0          ' <<< marking this pin for glitch-free read-modify-write

    dir portb.0 out

    do forever

      portb.0 = !portb.0

    loop
```

<span class="strong">**Key line:**</span>
`#option volatile portb.0` — without this, `portb.0 = !portb.0` compiles
to a plain read-modify-write on `PORTB` that can glitch other bits of
the port for an instant; with it, the compiler generates the extra
instructions needed to toggle only bit 0 cleanly.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="_option_nolatch" class="link" title="#Option NoLatch">#Option NoLatch</a> — a
    related fix for whole-port read-modify-write glitches via LATx
-   <a href="_option_shadowregister" class="link" title="#Option Shadowregister">#Option Shadowregister</a> — a
    whole-port shadow-latch alternative on chips without LATx

</div>

</div>
