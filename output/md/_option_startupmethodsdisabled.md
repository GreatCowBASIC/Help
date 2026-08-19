<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_startupmethodsdisabled"></span>\#Option STARTUPMETHODSDISABLED

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option STARTUPMETHODSDISABLED
```

This will instruct the compiler to disable all library startup
methods.   Examination of the generated ASM will show the disabled
methods as comments.   The calls to these methods can be added into the
user program at a suitable place ( if required ).

`#option STARTUPMETHODSDISABLED` is used to optimise the ASM created.

<span class="strong">**Introduction:**</span>

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16f877a

    'Example command
    #option STARTUPMETHODSDISABLED

    'User Code......
```

</div>
