<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_get"></span>Get

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    var = Get(Line, Column)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with the LCD R/W line (pin 5)
connected and if the following constant definition is used;
`#define LCD_RW`. Only available when the LCD is connected using the 4
or 8 bit mode and when the constant definition `#define LCD_NO_RW` is
NOT used.

<span class="strong">**Explanation:**</span>

The `Get` function reads the ASCII character code at a given location on
the LCD.

<span class="strong">**For more help, see**</span>
<a href="_put.html" class="link" title="Put">Put</a>,
<a href="_lcd_overview.html" class="link" title="LCD Overview">LCD Overview</a>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
