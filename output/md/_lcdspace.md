<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_lcdspace"></span>LCDSpace

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

``` screen
    Locate 0,0
    Print "Reset"
    wait 1 s
    cls

    LCD_Space_Tests:

    lcdcursor flash

    lcdspace 12

    print "*"
```

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
