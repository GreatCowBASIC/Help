<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="readdigitaltemp"></span>ReadDigitalTemp

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ReadDigitalTemp
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

Return the value of the sensor in two global variables. The following
two lines must be included in the GCBASIC source file.

``` screen
    #include <DS18B20.h>
    #define DQ PortC.3 ; change port configuration as required
```

This method returns whole part of the sensor value in the byte variable
`DSint`, the method also returns decimal part of the sensor value in the
byte variable `DSdec`.

<span class="strong">**Example:**</span>

``` programlisting
    'Chip Settings. Assumes the development board with with a 16F877A
    #chip 16F877A,1

    *#include <DS18B20.h>*

    'Use LCD in 4 pin mode and define LCD pins
    #define LCD_IO 4
    #define LCD_WIDTH 20                ;specified lcd width for clarity only.  20 is the default width
    #define LCD_RW PORTE.1
    #define LCD_RS PORTE.0
    #define LCD_Enable PORTE.2
    #define LCD_DB4 PORTD.4
    #define LCD_DB5 PORTD.5
    #define LCD_DB6 PORTD.6
    #define LCD_DB7 PORTD.7

    ' DS18B20 port settings
    #define DQ PortC.3

    do forever

        ReadDigitalTemp          ' <<< the ReadDigitalTemp instruction

        ' Display the integer value of the sensor on the LCD
        cls
        print "Temp"
        locate 0,8
        print DSInt
        print "."
        print DSdec
        print chr(223)+"C"
        wait 2 s

    loop
```

<span class="strong">**Key line:**</span> `ReadDigitalTemp` — reads the
sensor on the `DQ` pin and fills the two global variables `DSint` and
`DSdec` with the whole and decimal parts of the temperature, ready to
`Print` directly without any further conversion.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="ds18b20" class="link" title="DS18B20">DS18B20</a> — category
    overview
-   <a href="readtemp" class="link" title="ReadTemp">ReadTemp</a> — related
    command in the same category
-   <a href="readtemp12" class="link" title="ReadTemp12">ReadTemp12</a> — related
    command in the same category

</div>

</div>
