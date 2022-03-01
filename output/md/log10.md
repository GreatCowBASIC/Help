<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="log10"></span>Log10

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    returned_word_variable = Log10 (word_value)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Log10` command will return the base-10 logarithm, to 2 decimal
places.

The values returned are fixed-point numbers, with two decimal places
assumed on the right. or if you prefer, think of the values as being
scaled up by 100.

<span class="strong">**Example:**</span>

``` screen
    dim log_value as word
    log_value = log10 ( 10 )      'return 230 equate to 2.30
```

<span class="strong">**Supported in &lt;MATHS.H&gt;**</span>

</div>
