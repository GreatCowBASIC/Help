<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="adformat_deprecated_do_not_use"></span>ADFormat (Deprecated - Do not use)

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
ADFormat ( Format_Left | Format_Right )
```

<span class="strong">**Command Availability:**</span>

Available only on Microchip PIC microcontrollers.

<span class="strong">**Explanation:**</span>

`ADFormat` sets how a 10-bit ADC reading is packed into the two 8-bit
result registers on older Microchip PIC chips. Left-justified places the
top 8 bits of the result in the high byte and the remaining 2 bits in
the low byte; right-justified places the top 2 bits in the high byte and
the remaining 8 bits in the low byte. It is supported only on Microchip
PIC microcontrollers.

This command predates `ReadAD`, `ReadAD10`, and `ReadAD12`, which handle
the register layout and return a single ready-to-use variable
automatically. There is no need to call `ADFormat` in a program that
uses those functions, and it is recommended that new programs avoid it.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="analog_digital_conversion_overview" class="link" title="Analog/Digital Conversion Overview">Analog/Digital Conversion Overview</a> — category
    overview
-   <a href="readad10" class="link" title="ReadAD10">ReadAD10</a> — the
    modern replacement that returns an already-justified 10-bit value
-   <a href="adoff" class="link" title="ADOff">ADOff</a> — another
    obsolete command from the same era

</div>

</div>
