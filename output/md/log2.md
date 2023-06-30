<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="log2"></span>Log2

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    returned_word_variable = Log2 ( word_value )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Log2` command will return the base-2 logarithm, to 2 decimal
places.

The values returned are fixed-point numbers, with two decimal places
assumed on the right. or if you prefer, think of the values as being
scaled up by 100.

<span class="strong">**Example:**</span>

``` screen
    dim log_value as word
    log_value = log2 ( 10 )   'return 3321 equate to 3.321
```

<span class="strong">**Supported in &lt;MATHS.H&gt;**</span>

</div>
