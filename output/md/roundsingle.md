<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="roundsingle"></span>RoundSingle

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    rounded_single_value = RoundSingle( single_variable )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `RoundSingle` function returns a floating-point number that is a
rounded version of the specified number.

This operates the same as Microsoft’s `floor()`.

<span class="strong">**Example:**</span>

``` programlisting
    Dim singlevariable As Single
    Dim rounded_single_value As Single
    singlevariable = 7.85

    rounded_single_value = RoundSingle( singlevariable )          ' <<< the RoundSingle instruction
    ' rounded_single_value now holds 7.0
```

<span class="strong">**Key line:**</span>
`RoundSingle( singlevariable )` — rounds `7.85` down to `7.0`,
floor-style, rather than to the nearest whole number.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="abs" class="link" title="Abs">Abs</a> — related
    command in the same category
-   <a href="int" class="link" title="Int">Int</a> — truncating to
    an integer type instead of rounding within Single

</div>

</div>
