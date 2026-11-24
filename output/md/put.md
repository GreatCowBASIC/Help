<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="put"></span>Put

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Put Line, Column, Character
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Put` command writes the given ASCII character code to a specific
location on the LCD.

`Line` is the line number on the LCD display. A byte value from 0 to
255.

`Column` is the column number on the LCD display. A byte value from 0 to
255.

`Character` is the required ASCII code. A byte value from 0 to 255.

<span class="strong">**Example:**</span>

``` programlisting
    'A scrolling star for GCBASIC

    'Misc Settings
    #define SCROLL_DELAY 250 ms

    'General hardware configuration
    #chip 16F877A, 20

    'LCD connection settings
    #define LCD_IO 8
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_DATA_PORT PORTC
    #define LCD_RS PORTD.0
    #define LCD_RW PORTD.1
    #define LCD_Enable PORTD.2

    'Main routine
    For StarPos = 0 To 16
        If StarPos = 0 Then
            Put 0, 16, 32
            Put 0, 0, 42          ' <<< the Put instruction -- writes ASCII 42, an asterisk
        Else
            Put 0, StarPos - 1, 32
            Put 0, StarPos, 42
        End If
        Wait SCROLL_DELAY
    Next
```

<span class="strong">**Key line:**</span> `Put 0, 0, 42` — writes ASCII
code 42 (an asterisk, `*`) at line 0, column 0, while the preceding
`Put 0, 16, 32` erases the star’s previous position by writing ASCII 32
(a space) there instead.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="get" class="link" title="Get">Get</a> — reading a
    character back from the LCD instead of writing one
-   <a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a>

</div>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
