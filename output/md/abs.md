<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="abs"></span>Abs

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    integer_variable = Abs( integer_variable )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Abs` function computes the absolute value of an integer number, in
the range -32767 to +32767.

<span class="strong">**Example:**</span>

``` programlisting
    absolute_value = Abs( -127 )  ' Will return 127          ' <<< the Abs instruction
    absolute_value = Abs( 127 )   ' Will return 127 also
```

<span class="strong">**Key line:**</span> `Abs( -127 )` — strips the
sign from a negative value, returning `127` either way, regardless of
whether the input was positive or negative.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="average" class="link" title="Average">Average</a> — related
    command in the same category
-   <a href="difference" class="link" title="Difference">Difference</a> — related
    command in the same category

</div>

</div>
