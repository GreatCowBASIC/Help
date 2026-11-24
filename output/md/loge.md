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

The `Loge` command returns the base-e (natural) logarithm, to 2 decimal
places.

The values returned are fixed-point numbers, with two decimal places
assumed on the right — or, if you prefer, think of the values as being
scaled up by 100.

<span class="strong">**Example:**</span>

``` programlisting
    dim log_value as word
    log_value = loge ( 10 )          ' <<< the Loge instruction -- returns 230, equating to 2.30
```

<span class="strong">**Key line:**</span> `loge ( 10 )` — returns the
natural logarithm of 10 as a fixed-point word, `230`, representing 2.30.
<span class="strong">**Supported in &lt;MATHS.H&gt;**</span>

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="logarithms" class="link" title="Logarithms">Logarithms</a> — overview
    of the log family of functions
-   <a href="log2" class="link" title="Log2">Log2</a> — base-2
    logarithm
-   <a href="log10" class="link" title="Log10">Log10</a> — base-10
    logarithm

</div>

</div>
