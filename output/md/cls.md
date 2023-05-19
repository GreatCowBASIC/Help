<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="cls"></span>CLS

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    CLS
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `CLS` command clears the contents of the LCD, and returns the cursor
to the top left corner of the screen

<span class="strong">**Example :**</span>

``` screen
        'A Flashing text "Hello World" program for Great Cow BASIC

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
            CLS
            Wait 1 sec
        Loop
```

<span class="strong">**For more help, see**</span>
<a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
