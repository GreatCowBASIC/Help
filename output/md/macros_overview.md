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

Macros are similar to subroutines, but during compilation, everything is
inserted inline. This may increase the code size slightly, but it also
reduces stack usage.

Parameters are handled in a similar way to how constants are handled, so
there is a lot more freedom when passing things into a macro (unlike
subs or functions, where everything must be stored in a variable).

For example, for `PulseOut` one parameter is a pin, and the other is a
time length like "500 ms". Neither of those parameters could be stored
in a variable, but passing them in as macro parameters is possible.

<span class="strong">**Demonstration Program:**</span>

``` programlisting
    'PulseOut Macro
    macro Pulseout (Pin, Time)
        Set Pin On
        Wait Time          ' <<< a parameter used directly as a time literal, impossible with a sub or function
        Set Pin Off
    end macro
```

<span class="strong">**Key line:**</span> `Wait Time` — because macro
parameters are substituted like constants rather than copied into
variables, calling `Pulseout(PORTB.0, 500 ms)` compiles this line
directly to `Wait 500 ms`; a Sub or Function parameter cannot accept a
time literal like `500 ms` this way.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="measuring_a_pulse_width" class="link" title="Measuring a Pulse Width">Measuring a Pulse Width</a> — a
    macro used for timing-critical inline code
-   <a href="implementing_a_method_with_a_pin_name_as_a_parameter" class="link" title="Implementing a method with a Pin name as a parameter">Implementing a method with a Pin name as a parameter</a> — a
    macro used to pass a pin constant

</div>

</div>
