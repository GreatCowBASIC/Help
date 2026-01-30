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

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Trim` function will trim the 7-bit ASCII space character (value 32)
from text.

`Trim` removes all spaces from text except for single spaces between
words. Use `Trim` on text that you have received from another source
that may have irregular spacing at the left or right hand ends of the
string.

<span class="strong">**See Also**</span>
<a href="ltrim" class="link" title="Ltrim">Ltrim</a>,
<a href="rtrim" class="link" title="Rtrim">Rtrim</a>

</div>
