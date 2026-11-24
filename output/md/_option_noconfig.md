<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_noconfig"></span>\#Option NoConfig

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    #option NoConfig
```

This option will prevent the generated assembler from generating config
items.

`#option NoConfig` is used when using a bootloader.

<span class="strong">**Example:**</span>

``` programlisting
    'Set chip model
    #chip 16f877a

    'Example command
    #option NoConfig          ' <<< suppressing all compiler-generated config statements

    'User Code......
```

<span class="strong">**Key line:**</span> `#option NoConfig` — with this
option set, none of GCBASIC’s usual automatic CONFIG-word settings
(oscillator mode, watchdog timer, MCLR, etc. - see
<a href="configuration" class="link" title="Configuration">Configuration</a>)
are written into the generated ASM; this is required when a bootloader
has already configured those bits and must not have them overwritten.

</div>
