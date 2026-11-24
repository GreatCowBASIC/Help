<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="get"></span>Get

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    var = Get(Line, Column)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with the LCD R/W line (pin 5)
connected, and only when the following constant definition is used:
`#define LCD_RW`. Only available when the LCD is connected using 4-bit
or 8-bit mode, and when the constant definition `#define LCD_NO_RW` is
NOT used.

<span class="strong">**Explanation:**</span>

The `Get` function reads the ASCII character code currently displayed at
a given location on the LCD.

<span class="strong">**Example:**</span>

``` programlisting
    #define LCD_RW PORTD.1
    Dim CurrentChar As Byte

    CurrentChar = Get(0, 5)          ' <<< the Get instruction
```

<span class="strong">**Key line:**</span> `Get(0, 5)` — reads back the
ASCII code of whatever character the LCD is currently displaying at line
0, column 5, which requires the R/W line to be wired and enabled via
`#define LCD_RW`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="put" class="link" title="Put">Put</a> — writing a
    character to the LCD instead of reading one back
-   <a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a>

</div>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
