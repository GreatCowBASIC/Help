<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="lcdspace"></span>LCDSpace

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    LCDSpace value
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The LCDSpace command will print the required number of spaces on the LCD
display

`value` is a byte value from 1 to 255. Where the `value` is the number
of spaces required.

<span class="strong">**Example :**</span>

``` programlisting
    Locate 0,0
    Print "Reset"
    wait 1 s
    cls

    LCD_Space_Tests:

    lcdcursor flash

    lcdspace 12          ' <<< the LCDSpace instruction

    print "*"
```

<span class="strong">**Key line:**</span> `lcdspace 12` — writes 12
blank characters starting at the current cursor position, advancing the
cursor 12 columns so the following `print "*"` lands after the gap.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a> — category
    overview
-   <a href="cls" class="link" title="CLS">CLS</a> — clearing the
    whole display rather than writing spaces

</div>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
