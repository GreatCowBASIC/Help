<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="readtemp12"></span>ReadTemp12

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    byte_var = ReadTemp12
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`ReadTemp12` is a function that returns the raw value of the sensor. The
following two lines must be included in the GCBASIC source file.

``` programlisting
    #include <DS18B20.h>
    #define DQ PortC.3 ; change port configuration as required
```

Reads sensor and stores in output variable. The conversion takes up to
750ms. `Readtemp12` carries out a full 12 bit conversion.

This command is for advanced users only. For standard 'whole degree'
data use the `Readtemp` command.

The temperature is read back as the raw 12 bit data into a word variable
(0.0625 degree resolution). The user must interpret the data through
mathematical manipulation. See the DS18B20 datasheet for more
information on the 12 bit temperature/data information construct.

The function `readtemp12` does not work with the older DS1820 or DS18S20
as they have a different internal resolution. This command is not
designed to be used with parasitically powered DS18B20 sensors, the 5V
pin of the sensor must be connected.

<span class="strong">**Example:**</span>

``` screen
    'Chip Settings. Assumes the development board with with a 16F877A
    #chip 16F877A,1

    #include <DS18B20.h>

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

; ----- DS18B20 port settings
    #define DQ PortC.3

; ----- Variables
    Dim TempC_100 as word   ' a variabler to handle the temperature calculations
    Dim CCOUNT, SIGNBIT, WHOLE, FRACT, DIG as Byte
    Dim TempC_100 as word   ' a variable to handle the temperature calculations

    ccount = 0
    CLS

    do forever

       'Display the integer and decimal value of the sensor on the LCD

       ' The function readtemp12 returns the raw value of the sensor.
       ' The sensor is read as a 12 bit value. Each unit equates to 0.0625 of a degree
       DSdata = readtemp12          ' <<< the ReadTemp12 instruction
       SignBit = DSdata / 256 / 128
       If SignBit = 0 Then goto Positive
       ' its negative!
       DSdata = ( DSdata # 0xffff ) + 1 ' take twos comp

    Positive:

       ' Convert value * 0.0625. Mulitple value by 6 then add result to multiplication of the value with 25 then divide result by 100.
       TempC_100 =  DSdata * 6
       DSdata = ( DSdata * 25 ) / 100
       TempC_100 = TempC_100 + DSdata

       Whole = TempC_100 / 100
       Fract = TempC_100 % 100
       If SignBit = 0 Then goto DisplayTemp
       Print "-"

    DisplayTemp:
       locate 1,0
       print hex(ccount)
       print " Real"
       locate 1,8
       print str(Whole)
       print "."
      ' To ensure the decimal part is two digits
       Dig = Fract / 10
       print Dig
       Dig = Fract % 10
       print Dig
       print chr(223)
       print "C"
       wait 2 s
       ccount++

    loop
```

<span class="strong">**Key line:**</span> `DSdata = readtemp12` — reads
the sensor’s full raw 12-bit value (0.0625-degree resolution) with no
rounding; the rest of the example manually extracts the sign bit and
converts the raw units into whole and fractional degrees Celsius.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="ds18b20" class="link" title="DS18B20">DS18B20</a> — category
    overview
-   <a href="readtemp" class="link" title="ReadTemp">ReadTemp</a> — the
    simpler, pre-rounded whole-degree equivalent
-   <a href="readdigitaltemp" class="link" title="ReadDigitalTemp">ReadDigitalTemp</a> — returns
    ready-to-print integer and decimal parts instead of a raw value

</div>

</div>
