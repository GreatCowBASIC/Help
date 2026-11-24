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

The `Log10` command returns the base-10 logarithm, to 2 decimal places.

The values returned are fixed-point numbers, with two decimal places
assumed on the right — or, if you prefer, think of the values as being
scaled up by 100.

<span class="strong">**Example:**</span>

``` programlisting
    dim log_value as word
    log_value = log10 ( 10 )      ' <<< the Log10 instruction -- returns 230, equating to 2.30
```

<span class="strong">**Key line:**</span> `log10 ( 10 )` — returns
`230`, representing 2.30, the base-10 logarithm of 10. <span
class="strong">**Supported in &lt;MATHS.H&gt;**</span>

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="logarithms" class="link" title="Logarithms">Logarithms</a> — overview
    of the log family of functions
-   <a href="log2" class="link" title="Log2">Log2</a> — base-2
    logarithm
-   <a href="loge" class="link" title="Loge">Loge</a> — natural
    (base-e) logarithm

</div>

</div>
