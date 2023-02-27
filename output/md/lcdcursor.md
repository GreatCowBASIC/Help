<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="lcdcursor"></span>LCDCursor

</div>

</div>

</div>

<span class="strong">**Syntax**</span>:

``` screen
    LCDCursor value
```

<span class="strong">**Command Availability**</span>:

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The LCDCursor command will accept the following parameters:

`LCDON`, `LCDOFF`, `CURSORON`, `CURSOROFF`, `FLASHON`, `FLASHOFF`

`FLASH`, and `ON/OFF` have been retained for backward compatibility with
older releases of GCB.

`LCDON` will turn on (restore) the LCD display.  
`LCDOFF` will turn off (hide) the LCD display.  
`CURSORON` will turn on the cursor.  
`CURSOROFF` will turn off the cursor.  
`FLASHON` will flash the cursor.  
`FLASHOFF` will stop flashing the cursor.

<span class="strong">**Example :**</span> \#config osc = intrc

``` screen
    #chip 16f877a, 8

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

    Start:
    CLS
    WAIT 3 s
    PRINT "START DEMO"
    locate 1,0
    PRINT "DISPLAY ON"

    wait 3 s

    CLS
    Locate 0,0
    Print "Cursor ON"
    Locate 1,0
    LCDcursor CursorOn
    wait 3 S

    CLS
    LCDcursor CursorOFF
    locate 0,0
    Print "Cursor OFF"
    wait 3 s

    CLS
    Locate 0,0
    Print "FLASH ON"
    Locate 1,0
    LCDcursor FLASHON
    wait 3 s

    CLS
    locate 0,0
    Print "FLASH OFF"
    LCDCURSOR FLASHOFF
    wait 3 sec

    Locate 0,0
    Print "CURSOR&FLASH ON" 'Both are on at the same time
    locate 1,0
    LCDCURSOR CURSORON
    LCDCURSOR FLASHON
    Wait 3 sec

    Locate 0,0
    Print "CURSOR FLASH OFF"
    locate 1,0
    LCDCURSOR CursorOFF
    LCDCURSOR FLASHOFF
    Wait 3 sec

    CLS
    Locate 0,4
    PRINT "Flashing"
    Locate 1,4
    Print "Display"
    wait 500 ms

    repeat 5
        LCDCURSOR LCDOFF
        wait 500 ms
        LCDCURSOR LCDON
        wait 500 ms
    end repeat

    CLS
    Locate 0,0
    Print "DISPLAY OFF"
    Locate 1,0
    Print "FOR 5 SEC"
    Wait 2 SEC
    LCDCURSOR LCDOFF
    WAIT 5 s

    CLS
    Locate 0,0
    LCDCURSOR LCDON
    Print "END DEMO"
    wait 3 s
    goto start
```

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
