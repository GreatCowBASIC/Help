<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="rtrim"></span>Rtrim

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = Rtrim(stringvar)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Rtrim` function trims the 7-bit ASCII space character (value 32)
from the right-hand side of a string.

Use `Rtrim` on text you have received from another source that may have
irregular spacing at the right-hand end of the string.

<span class="strong">**Example:**</span>

``` programlisting
    Dim TestData As String
    TestData = "Hello   "

    TestData = RTRIM(TestData)          ' <<< the RTRIM instruction
    ' TestData now holds "Hello", with the trailing spaces removed
```

<span class="strong">**Key line:**</span> `RTRIM(TestData)` — removes
only the trailing spaces from `TestData`, leaving any spaces at the
start untouched.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="trim" class="link" title="Trim">Trim</a> — trimming
    both ends at once
-   <a href="ltrim" class="link" title="Ltrim">Ltrim</a> — trimming
    only the left-hand side

</div>

</div>
