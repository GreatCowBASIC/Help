<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="average"></span>Average

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    integer_variable = Average(byte_variable1 , byte_variable2)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

A function that returns the average of two numbers. This only supports
byte variables.

It provides a very fast way to calculate the average of two 8-bit
numbers.

<span class="strong">**Example:**</span>

``` programlisting
 average_value = Average(8,4)   ' Will return 6          ' <<< the Average instruction
```

<span class="strong">**Key line:**</span> `Average(8,4)` — adds the two
byte values and halves the result in a single fast operation, returning
`6`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="abs" class="link" title="Abs">Abs</a> — related
    command in the same category
-   <a href="difference" class="link" title="Difference">Difference</a> — related
    command in the same category

</div>

</div>
