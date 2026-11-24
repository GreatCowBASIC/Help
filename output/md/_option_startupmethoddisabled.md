<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_startupmethoddisabled"></span>\#Option StartupMethodDisabled

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    #option StartupMethodDisabled
```

This will instruct the compiler to disable all library startup methods.
Examination of the generated ASM will show the disabled methods as
comments. The calls to these methods can be added into the user program
at a suitable place, if required.

`#option StartupMethodDisabled` is used to optimise the ASM created.

<span class="strong">**Example:**</span>

``` programlisting
    'Set chip model
    #chip 16f877a

    'Example command
    #option StartupMethodDisabled

    'User Code......
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="configuration" class="link" title="Configuration">Configuration</a> — the
    config bits this option suppresses
-   <a href="_option_bootloader" class="link" title="#Option Bootloader">#Option Bootloader</a> — the
    typical reason for using \#option NoConfig
-   <a href="compiler_control" class="link" title="Compiler Control">Compiler Control</a> — redirecting
    or cancelling individual \#startup routines instead of disabling all
    of them

</div>

</div>
