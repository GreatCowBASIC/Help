<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="cls"></span>CLS

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    CLS
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `CLS` command clears the contents of the LCD, and returns the cursor
to the top left corner of the screen

<span class="strong">**Example :**</span>

``` programlisting
        'A Flashing text "Hello World" program for GCBASIC

        'General hardware configuration
        #chip 16F877A, 20

        'LCD connection settings
        #define LCD_IO 8
        #define LCD_DATA_PORT PORTC
        #define LCD_RS PORTD.0
        #define LCD_RW PORTD.1
        #define LCD_Enable PORTD.2
        #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width


        'Main routine
        Do
            Print "Hello World"
            Wait 1 sec
            CLS          ' <<< the CLS instruction
            Wait 1 sec
        Loop
```

<span class="strong">**Key line:**</span> `CLS` — clears the whole
display and returns the cursor to the top-left corner; since the loop
calls `Print` again immediately afterward, the effect is text that
flashes on and off every second.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a> — LCD
    wiring and configuration background
-   <a href="print" class="link" title="Print">Print</a> — displaying
    text after clearing the screen, as used above
-   <a href="locate" class="link" title="Locate">Locate</a> — moving
    the cursor to a specific position instead of clearing the whole
    display

</div>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
