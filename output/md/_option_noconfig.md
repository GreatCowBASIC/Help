<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_noconfig"></span>\#Option NoConfig

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option NoConfig
```

This option will prevent the generated assembler from generating
\_Config items.

`#option NoConfig` is used when using a bootloader.

<span class="strong">**Introduction:**</span>

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16f877a

    'Example command
    #option NoConfig

    'User Code......
```

</div>
