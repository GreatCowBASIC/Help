<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="loge"></span>Loge

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    returned_word_variable = Loge ( word_value )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Loge` command will return the base-e logarithm, to 2 decimal
places.

The values returned are fixed-point numbers, with two decimal places
assumed on the right. or if you prefer, think of the values as being
scaled up by 100.

<span class="strong">**Example:**</span>

``` screen
    dim log_value as word
    log_value = loge ( 10 )
```

<span class="strong">**Supported in &lt;MATHS.H&gt;**</span>

</div>
