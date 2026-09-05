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

``` programlisting
    'A Light Meter program.

    'General hardware configuration
    #chip 16F877A, 20
    #define LIGHTSENSOR AN0

    'LCD connection settings
    #define LCD_IO 8
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_DATA_PORT PORTC
    #define LCD_RS PORTD.0
    #define LCD_RW PORTD.1
    #define LCD_ENABLE PORTD.2

    CLS
    Print "Light Meter"
    Locate 1,2
    Print "A GCBASIC Demo"
    Wait 2 s

    Do
        CLS
        Print "Light Level: "
        Print ReadAD(LIGHTSENSOR)          ' <<< Print with a numeric expression -- the syntax variant this page documents
        Wait 250 ms
    Loop
```

<span class="strong">**Key line:**</span>
`Print ReadAD(LIGHTSENSOR)` — `Print` accepts the numeric result of
`ReadAD` directly; no string conversion is needed.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a> — LCD
    wiring and configuration background
-   <a href="locate" class="link" title="Locate">Locate</a> — positioning
    the cursor before printing, as used above
-   <a href="cls" class="link" title="CLS">CLS</a> — clearing the
    display before printing, as used above
-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — reading
    the light level printed in the example above
-   <a href="wait" class="link" title="Wait">Wait</a> — pausing
    between readings, as used above

</div>

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

</div>
