<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="lcdcreategraph"></span>LCDCreateGraph

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    LCDCreateGraph value
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The LCDCreateGraph command will create a graph like character which can
then be displayed on the LCD

<span class="strong">**Example :**</span>

``` screen
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
    cls

    Graph_Tests:

    cls
    'Draw the custom character - fill the LCD
    repeat 64
          LCDWriteChar 0
    end Repeat

    ' Update the characters at high speed without re-printing on LCD
    for graphvalue = 0 to 8
        LCDCreateGraph ( 0 ,  graphvalue )
        wait 100 ms
    next
```

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
