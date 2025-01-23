<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_volatile"></span>\#Option Volatile

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option volatile `bit`
```

This option ensure port setting are glitch-free.

<span class="strong">**Introduction:**</span>

\#option volatile bit where bit is an IO bit, like PORTB.0 appended.

This will cause the compiler to set the bit without any glitches when
copying a value from another variable, but will increase code size
slightly.

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16f877a

    'Example command
    #option volatile portb.0

    dir portb.0 out

    do forever

      portb.0 = !portb.0

    loop
```

</div>
