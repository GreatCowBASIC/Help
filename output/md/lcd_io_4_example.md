<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_4_example"></span>LCD\_IO 4 Example

</div>

</div>

</div>

This is a connection mode 4 Driver to demonstrate LCD features. This for
the 16F877A, but, it can easily be adapted for other microcontrollers.

A 2 by 16 LCD is assumed.

``` programlisting
    #chip 16F877A,20

    'Use LCD in 4 pin mode and define LCD pins
    #define LCD_IO 4          ' <<< the constant that selects 4-bit connection mode
    #define LCD_RW PORTE.1
    #define LCD_RS PORTE.0
    #define LCD_Enable PORTE.2
    #define LCD_DB4 PORTD.4
    #define LCD_DB5 PORTD.5
    #define LCD_DB6 PORTD.6
    #define LCD_DB7 PORTD.7
    #define LCD_WIDTH 16                ;this example assumes a 16-character-wide LCD; the library default is 20

    ;----- Main Program

    do forever

            Print "GCBASIC 2021"
            wait 3 s
            CLS

    loop
    end
```

<span class="strong">**Key line:**</span> `#define LCD_IO 4` — selects
the 4-bit parallel connection mode, which requires `LCD_RS`, `LCD_RW`,
`LCD_Enable`, and only the upper four data lines (`LCD_DB4` through
`LCD_DB7`) to be wired to the microcontroller.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a> — full
    reference for this connection mode
-   <a href="lcd_width" class="link" title="LCD_WIDTH">LCD_WIDTH</a> — setting
    the display width, as used above
-   <a href="lcd_io_8_example" class="link" title="LCD_IO 8 Example">LCD_IO 8 Example</a> — the
    8-bit parallel equivalent
-   <a href="lcd_io_2_example" class="link" title="LCD_IO 2 Example">LCD_IO 2 Example</a> — a
    shift-register based alternative needing fewer pins

</div>

</div>
