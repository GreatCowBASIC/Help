<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="lcdhome"></span>LCDHome

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    LCDHome
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `LCDHome` command will return the cursor to home position.

The currentcontents of the LCD screen will be retained.

<span class="strong">**Example:**</span>

``` screen
    ;Chip Settings
    #chip 16F88,8

    ;Defines (Constants)
    #define LCD_IO 4
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
    LCDHome
    wait 3 s
```

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
