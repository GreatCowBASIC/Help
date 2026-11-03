<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="_option_stringlimitcheck"></span>\#Option StringLimitCheck

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    #option StringLimitCheck
```

<span class="strong">**Explanation:**</span>

Assigning a literal string, or copying one string into another, longer
than a fixed-length string’s declared `* Length` compiles without
warning (see <a href="dim" class="link" title="Dim">Dim</a>) - the
extra characters overrun whatever RAM comes after the string at runtime.
`#option StringLimitCheck` closes this: every string assignment is
clamped to the destination’s declared length, so an over-long source is
silently truncated instead of overwriting adjacent variables.

The check applies to the library routines every string assignment
already goes through (`SysReadString` for a literal/table source,
`SysCopyString` for copying one variable into another) - no change is
needed to existing code beyond adding the option. The destination’s
declared length is exported as an assembler constant,
`<name>_STRING_LENGTH`, and loaded before each call; a destination with
no single fixed length (a string passed by reference, an array element)
is not limited (255, effectively unlimited).

Supported on PIC (12-bit, 14-bit, enhanced mid-range, PIC18) and AVR. On
any other target, the option is ignored with a warning
(`WarningStringLimitCheck`).

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F877A, 20
    #option StringLimitCheck

    Dim Greeting As String * 5
    Greeting = "Hello, World!"     'Without this option: overruns Greeting's 5-character buffer.
                                    'With it: Greeting is truncated to "Hello" instead.
    Do
    Loop
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="dim" class="link" title="Dim">Dim</a> — declaring a
    fixed-length string with `As String * Length`
-   <a href="ubound" class="link" title="UBound">UBound</a> — for
    finding a string’s declared length at runtime

</div>

</div>
