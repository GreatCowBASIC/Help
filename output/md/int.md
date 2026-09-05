<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="int"></span>Int

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    integer_variable = Int( single_variable )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Int` function truncates a floating-point (`Single`) value down to
its integer part, discarding the fractional part (it does not round).
The result is returned as an integer, so it must fit within the integer
variable range.

<span class="strong">**Example:**</span>

``` programlisting
    Dim singlevariable As Single
    Dim integer_value As Integer
    singlevariable = 7.85

    integer_value = Int( singlevariable )          ' <<< the Int instruction
    ' integer_value now holds 7
```

<span class="strong">**Key line:**</span>
`Int( singlevariable )` — drops the `.85` fractional part of `7.85`,
leaving the integer value `7` (not rounded to `8`).

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="abs" class="link" title="Abs">Abs</a> — related
    command in the same category
-   <a href="roundsingle" class="link" title="RoundSingle">RoundSingle</a> — rounding
    to the nearest whole number instead of truncating

</div>

</div>
