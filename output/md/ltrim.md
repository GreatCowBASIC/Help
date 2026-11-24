<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ltrim"></span>Ltrim

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = LTRIM(stringvar)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Ltrim` function trims the 7-bit ASCII space character (value 32)
from the left-hand side of a string.

Use `Ltrim` on text you have received from another source that may have
irregular spacing at the left-hand end of the string.

<span class="strong">**Example:**</span>

``` programlisting
    Dim TestData As String
    TestData = "   Hello"

    TestData = LTRIM(TestData)          ' <<< the LTRIM instruction
    ' TestData now holds "Hello", with the leading spaces removed
```

<span class="strong">**Key line:**</span> `LTRIM(TestData)` — removes
only the leading spaces from `TestData`, leaving any spaces at the end
untouched.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="trim" class="link" title="Trim">Trim</a> — trimming
    both ends at once
-   <a href="rtrim" class="link" title="Rtrim">Rtrim</a> — trimming
    only the right-hand side

</div>

</div>
