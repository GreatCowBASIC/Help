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
    cls

    Graph_Tests:

    cls
    'Draw the custom character - fill the LCD
    repeat 64
          LCDWriteChar 0
    end Repeat

    ' Update the characters at high speed without re-printing on LCD
    for graphvalue = 0 to 8
        LCDCreateGraph ( 0 ,  graphvalue )          ' <<< the LCDCreateGraph instruction
        wait 100 ms
    next
```

<span class="strong">**Key line:**</span>
`LCDCreateGraph ( 0 , graphvalue )` — redefines custom character 0 to
show a bar graph filled to the level given by `graphvalue`; because
every cell on the display already holds character 0 (from the
`LCDWriteChar 0` loop above), redefining the character updates the whole
graph at once without reprinting anything.

<span class="strong">**Supported in &lt;LCD.H&gt;**</span>

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcdcreatechar" class="link" title="LCDCreateChar">LCDCreateChar</a> — related
    command in the same category
-   <a href="lcdcmd" class="link" title="LCDCmd">LCDCmd</a> — related
    command in the same category

</div>

</div>
