<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_required"></span>\#Option Required

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    #option REQUIRED PIC|AVR CONSTANT %message.dat entry%
    #option REQUIRED PIC|AVR CONSTANT "Message string"

    or

    #option REQUIRED DISABLE
```

This option ensures that a specific CONSTANT exists within a library, to
ensure a specific capability is available on the microcontroller.

<span class="strong">**Explanation:**</span>

This will cause the compiler to check that the CONSTANT is a non-zero
value. If the CONSTANT does not exist, it will be treated as a zero
value.

<span class="strong">**Example:**</span>

This example tests the CONSTANT `CHIPUSART` for both the PIC and AVR
microcontrollers. If the CONSTANT is zero or does not exist, then the
string will be displayed as an error message.

``` programlisting
    #option REQUIRED PIC CHIPUSART "Hardware Serial operations. Remove USART commands to resolve errors."
    #option REQUIRED AVR CHIPUSART "Hardware Serial operations. Remove USART commands to resolve errors."          ' <<< requiring a real hardware capability before compiling USART code
```

<span class="strong">**Key line:**</span>
`#option REQUIRED AVR CHIPUSART "…​"` — checks that the `CHIPUSART`
constant (see
<a href="other_directives" class="link" title="Other directives">Other directives</a>)
is non-zero for the target AVR chip; if the selected chip has no
hardware USART, compilation fails immediately with the given message,
rather than producing broken ASM later.

<span class="strong">**Disabling:**</span>

To disable checking this capability, add the following directive.

``` programlisting
    #option REQUIRED DISABLE
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="other_directives" class="link" title="Other directives">Other directives</a> — the
    CHIPxxx constants this option checks

</div>

</div>
