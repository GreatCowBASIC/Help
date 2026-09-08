<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_config"></span>\#config

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #config option1, option2, ... , optionN
```

<span class="strong">**Explanation:**</span>

The `#config` directive is used to specify configuration options for the
chip. There is a detailed explanation of `#config` in the
<a href="configuration" class="link" title="Configuration">Configuration</a>
section of the help.

<span class="strong">**XC8-style `#pragma config` syntax:**</span>

For compatibility with source ported from Microchip’s XC8 compiler,
GCBASIC also accepts `#pragma config option1, option2, …​ , optionN`.
The preprocessor rewrites any line starting with `#pragma config`
(case-insensitive) directly into an equivalent `#config` line before
compilation, so the two forms are interchangeable and `#pragma config`
options follow the same rules as `#config` above.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="configuration" class="link" title="Configuration">Configuration</a> — the
    full explanation of PIC CONFIG words, AVR fuses, and GCBASIC’s
    automatic defaults
-   <a href="_chip" class="link" title="#chip">#chip</a> — selecting
    the target chip and clock frequency

</div>

</div>
