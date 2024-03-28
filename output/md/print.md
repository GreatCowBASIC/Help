<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="print"></span>Print

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Print string
    Print byte
    Print word
    Print long
    Print integer
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The Print command will show the contents of a variable on the LCD. It
can display string, word, byte, long or integer variables.

<span class="strong">**Example:**</span>

``` screen
    'A Light Meter program.

    'General hardware configuration
    #chip 16F877A, 20
    #define LightSensor AN0

    'LCD connection settings
    #define LCD_IO 8
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_DATA_PORT PORTC
    #define LCD_RS PORTD.0
    #define LCD_RW PORTD.1
    #define LCD_Enable PORTD.2

    CLS
    Print "Light Meter"
    Locate 1,2
    Print "A GCBASIC Demo"
    Wait 2 s

    Do
        CLS
        Print "Light Level: "
        Print ReadAD(LightSensor)
        Wait 250 ms
    Loop
```

<span class="strong">**For more help, see**</span>
<a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
