<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="chr"></span>Chr

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = CHR(bytevar)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `CHR` function creates a one-character string from an ANSI (1-byte)
character code.

`ASC` is the natural complement of `CHR` — it converts a character back
into its byte code.

<span class="strong">**Example:**</span>

``` programlisting
    _string_ = CHR( 65 )   ' Returns "A"          ' <<< the CHR instruction

    _string_ = CHR( 66 )   ' Returns "B"
```

<span class="strong">**Key line:**</span> `CHR( 65 )` — converts the
ASCII code 65 into the one-character string `"A"`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="asc" class="link" title="Asc">Asc</a> — the inverse
    operation, converting a character back to its byte code

</div>

</div>
