<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="locate"></span>Locate

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Locate Line, Column
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The Locate command is used to move the cursor on the LCD to the given
location.

`Line` is line number on the LCD display. A byte value from 0 to 255.

`Column` is column number on the LCD display. A byte value from 0 to
255.

<span class="strong">**Example :**</span>

``` programlisting
    'A Hello World program for GCBASIC.
    'Uses Locate to show "World" on the second line

    'General hardware configuration
    #chip 16F877A, 20

    'LCD connection settings
    #define LCD_IO 8
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_DATA_PORT PORTC
    #define LCD_RS PORTD.0
    #define LCD_RW PORTD.1
    #define LCD_ENABLE PORTD.2

    'Main routine
    Print "Hello"
    Locate 1, 5          ' <<< the Locate instruction
    Print "World"
```

<span class="strong">**Key line:**</span> `Locate 1, 5` — moves the
cursor to line 1, column 5 before the next `Print`, so "World" appears
on the second line rather than overwriting "Hello".

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a> — LCD
    wiring and configuration background
-   <a href="print" class="link" title="Print">Print</a> — displaying
    text at the located position, as used above
-   <a href="cls" class="link" title="CLS">CLS</a> — clearing the
    whole display instead of moving the cursor

</div>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
