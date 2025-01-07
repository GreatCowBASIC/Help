<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_difference"></span>Difference

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

A function that returns the difference between of two numbers. This only
supports byte or word variables.

<span class="strong">**Example:**</span>

``` screen
    Difference( 8 ,4 ) ' Will return 4
    Difference( 0xff01 , 0xfffa ) ' Will return 0xf9 or 249d
```

</div>
