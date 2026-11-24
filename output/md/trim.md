<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="trim"></span>Trim

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  stringvar = Trim(stringvar)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Trim` function trims the 7-bit ASCII space character (value 32)
from text.

`Trim` removes all spaces from text except for single spaces between
words. Use `Trim` on text you have received from another source that may
have irregular spacing at the left or right-hand ends of the string.

<span class="strong">**Example:**</span>

``` programlisting
    Dim TestData As String
    TestData = "   Hello   "

    TestData = TRIM(TestData)          ' <<< the TRIM instruction
    ' TestData now holds "Hello", with leading and trailing spaces removed
```

<span class="strong">**Key line:**</span> `TRIM(TestData)` — removes the
spaces from both ends of `TestData` in a single call, equivalent to
`LTRIM` followed by `RTRIM`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="ltrim" class="link" title="Ltrim">Ltrim</a> — trimming
    only the left-hand side
-   <a href="rtrim" class="link" title="Rtrim">Rtrim</a> — trimming
    only the right-hand side

</div>

</div>
