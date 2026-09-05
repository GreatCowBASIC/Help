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

The `Log2` command returns the base-2 logarithm, to 2 decimal places.

The values returned are fixed-point numbers, with two decimal places
assumed on the right — or, if you prefer, think of the values as being
scaled up by 100.

<span class="strong">**Example:**</span>

``` programlisting
    dim log_value as word
    log_value = log2 ( 10 )   ' <<< the Log2 instruction -- returns 3321, equating to 3.321
```

<span class="strong">**Key line:**</span> `log2 ( 10 )` — returns
`3321`, which represents 3.321 once the implied two decimal places are
accounted for. <span class="strong">**Supported in
&lt;MATHS.H&gt;**</span>

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="logarithms" class="link" title="Logarithms">Logarithms</a> — overview
    of the log family of functions
-   <a href="loge" class="link" title="Loge">Loge</a> — natural
    (base-e) logarithm
-   <a href="log10" class="link" title="Log10">Log10</a> — base-10
    logarithm

</div>

</div>
