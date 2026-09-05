<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="difference"></span>Difference

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Difference ( word_variable1 , word_variable2 ) or
    Difference ( byte_variable1 , byte_variable2 )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

A function that returns the difference between two numbers. This only
supports byte or word variables.

<span class="strong">**Example:**</span>

``` programlisting
    Difference( 8 ,4 ) ' Will return 4          ' <<< the Difference instruction
    Difference( 0xff01 , 0xfffa ) ' Will return 0xf9 or 249d
```

<span class="strong">**Key line:**</span> `Difference( 8 ,4 )` — returns
the unsigned distance between the two values (`4`), regardless of which
argument is larger.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="abs" class="link" title="Abs">Abs</a> — related
    command in the same category
-   <a href="average" class="link" title="Average">Average</a> — related
    command in the same category

</div>

</div>
