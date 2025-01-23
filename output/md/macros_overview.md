<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="macros_overview"></span>Macros Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

You can use macros within your GCBASIC code.

Macros are similar to subroutines. But during compilation, everything is
inserted inline. This may increase the code size slightly, but it also
reduces stack usage.

Parameters are handled in a similar way to how constants are handled, so
there is a lot more freedom when passing things in to a macro. (Unlike
subs or functions, where everything must be stored in a variable.)

For example, for `PulseOut` one parameter is a pin, and the other is a
time length like "500 ms". Neither of those parameters could be stored
in a variable, but passing them in as macro parameters is possible.

<span class="strong">**Demonstration Program:**</span>

``` screen
    'PulseOut Macro
    macro Pulseout (Pin, Time)
        Set Pin On
        Wait Time
        Set Pin Off
    end macro
```

</div>
