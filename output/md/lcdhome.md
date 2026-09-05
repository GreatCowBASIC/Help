<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="lcdhome"></span>LCDHome

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    LCDHome
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `LCDHome` command will return the cursor to home position.

The currentcontents of the LCD screen will be retained.

<span class="strong">**Example:**</span>

``` programlisting
    ;Chip Settings
    #chip 16F88,8

    ;Defines (Constants)
    #define LCD_IO 4
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_RS PORTA.6
    #define LCD_NO_RW
    #define LCD_Enable PORTA.7
    #define LCD_DB4 PORTB.4
    #define LCD_DB5 PORTB.5
    #define LCD_DB6 PORTB.6
    #define LCD_DB7 PORTB.7

    Locate 0,0
    Print "Reset"
    wait 1 s
    ClS

    Cursor_Home_Tests:

    cls
    lcdcursor flash
    print "Test Home Cmd"
    LCDHome          ' <<< the LCDHome instruction
    wait 3 s
```

<span class="strong">**Key line:**</span> `LCDHome` — moves the cursor
back to row 0, column 0 without clearing the display, so the text
already printed by `print "Test Home Cmd"` remains visible.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="cls" class="link" title="CLS">CLS</a> — clears the
    display and also returns the cursor to home
-   <a href="locate" class="link" title="Locate">Locate</a> — moving
    the cursor to any specific position, not just home
-   <a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a> — category
    overview

</div>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
