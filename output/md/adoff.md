<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="adoff"></span>ADOff

</div>

</div>

</div>

<span class="strong">**This command is obsolete.**</span> There should
be no need to call it in a modern GCBASIC program.

GCBASIC automatically disables the A/D converter and returns every
analog-capable pin to digital mode:

<div class="itemizedlist">

-   when the program starts, and
-   immediately after every call to `ReadAD`, `ReadAD10`, or `ReadAD12`.

</div>

Because of this automatic behaviour, calling `ADOff` yourself has no
effect on current versions of the compiler. It is kept only so that
older programs that still call it continue to compile.

It is recommended that this command be removed from all new and existing
programs.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="analog_digital_conversion_overview" class="link" title="Analog/Digital Conversion Overview">Analog/Digital Conversion Overview</a> — category
    overview
-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — the
    single-channel read that triggers the automatic pin cleanup this
    page describes
-   <a href="adformat_deprecated_do_not_use" class="link" title="ADFormat (Deprecated - Do not use)">ADFormat (Deprecated - Do not use)</a> — another
    obsolete command from the same era

</div>

</div>
