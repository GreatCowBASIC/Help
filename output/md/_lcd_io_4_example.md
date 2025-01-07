<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_lcd_io_4_example"></span>LCD\_IO 4 Example

</div>

</div>

</div>

This is a connection mode 4 Driver to demonstrate LCD features. This for
the 16F877A, but, it can easily be adapted for other microcontrollers.

A 2 by 16 LCD is assumed.

``` screen
    #chip 16F877A,20

    'Use LCD in 4 pin mode and define LCD pins
    #define LCD_IO 4
    #define LCD_RW PORTE.1
    #define LCD_RS PORTE.0
    #define LCD_Enable PORTE.2
    #define LCD_DB4 PORTD.4
    #define LCD_DB5 PORTD.5
    #define LCD_DB6 PORTD.6
    #define LCD_DB7 PORTD.7
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width

    ;----- Main Program

    do forever

            Print "GCBASIC 2021"
            wait 3 s
            CLS

    loop
    end
```

</div>
