<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_10_example"></span>LCD\_IO 10 Example

</div>

</div>

</div>

LCD\_IO 10 provides support for character LCD modules that use an
I2C/TWI interface based on the <span class="strong">**PCF8574 or
PCF8574A I/O expander**</span>.   This for the 16F877A, but, it can
easily be adapted for any other microcontrollers.

A 2 by 16 LCD is assumed with the LCD being driven using an LCD I2C
adapter. Two types are supported the YwRobot LCD1602 IIC V1 / a
Sainsmart LCD\_PIC I2C adapter or the Ywmjkdz I2C adapter with pot bent
over top of chip.

<span class="strong">**Example - Joy-IT/Raspberry Pi LCD PCB:**</span>

This demonstrates using Joy-IT/Raspberry Pi LCD PCB by changing the
I2C\_LCD\_\* constants that control this mode of LCD\_IO operations.

``` programlisting
      #chip AVR128DA28, 24
      #option explicit

      // Define Hardware I2C settings
      HI2CMode Master
      #DEFINE HI2C_DATA  PORTA.2
      #DEFINE HI2C_CLOCK PORTA.3

      #DEFINE LCD_IO 10          ' <<< the constant that selects the PCF8574 I2C connection mode
      // LCD_I2C_Address_1 is not required because default address
      //  #DEFINE LCD_I2C_ADDRESS_1 0X4E

      // This settings are suited for a joy-it adapter. Its made for the Raspberry Pi.
      // This changes the default expander port mappings.
      #DEFINE I2C_LCD_E  I2C_LCD_BYTE.7
      #DEFINE I2C_LCD_RW I2C_LCD_BYTE.5
      #DEFINE I2C_LCD_RS I2C_LCD_BYTE.4
      #DEFINE I2C_LCD_BL I2C_LCD_BYTE.6
      #DEFINE I2C_LCD_D4 I2C_LCD_BYTE.0
      #DEFINE I2C_LCD_D5 I2C_LCD_BYTE.1
      #DEFINE I2C_LCD_D6 I2C_LCD_BYTE.2
      #DEFINE I2C_LCD_D7 I2C_LCD_BYTE.3


      // ----- Main body of program commences here.

      Print "Hello World"
```

<span class="strong">**Key line:**</span> `#DEFINE LCD_IO 10` — selects
the PCF8574/PCF8574A I2C expander connection mode; the `I2C_LCD_*`
constants that follow remap the expander’s port bits, which is only
needed when the adapter’s PCB layout (such as the Joy-IT/Raspberry Pi
board here) differs from the library’s default mapping.

<span class="strong">**Example - Multiple LCDs:**</span>

This demonstrates reading a DS18B20 and showing the results on multiple
LCDs.

``` programlisting
    #chip mega328p, 16
    #include <DS18B20.h>

    ; ----- Define Hardware settings
    ' Define I2C settings - CHANGE PORTS
     #DEFINE I2C_MODE Master
     #DEFINE I2C_DATA PORTC.4
     #DEFINE I2C_CLOCK PORTC.5
     #DEFINE I2C_DISABLE_INTERRUPTS ON

    '''Set up LCD
     #DEFINE LCD_IO 10
     #DEFINE LCD_I2C_ADDRESS_1 0x4E                ; LCD 1
     #DEFINE LCD_I2C_ADDRESS_2 0x4C                ; LCD 2

    ; ----- Constants
    ' DS18B20 port settings - this is required
       #DEFINE DQ PortC.3

    ; ----- Quick Command Reference:

    '''Set LCD_10 to 10 for the YwRobot LCD1602 IIC V1 or the Sainsmart LCD_PIC I2C adapter
    '''Set LCD_10 to 12 for the Ywmjkdz I2C adapter with pot bent over top of chip

    ; ----- Variables
    dim TempC_100 as word   ' a variabler to handle the temperature calculations
    dim DSdataRaw as Integer


    ; ----- Main body of program commences here.

    'Change to the correct LCD by setting     LCD_I2C_ADDRESS_Current to the correct address then write to LCD.
    LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_1: DisplayInformation ( 1 )
    LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_2: DisplayInformation ( 1 )          ' <<< switching the active LCD via LCD_I2C_ADDRESS_Current
    wait 4 s
    LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_1:  CLS
    LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_2:  CLS

    ccount = 0
    Do forever

        ' The function readtemp12 returns the raw value of the sensor.
        ' The sensor is read as a 12 bit value therefore each unit equates to 0.0625 of a degree
        DSdataRaw = readtemp12    ; save to this variable to prevent the delay bewtween screen up dates
        ' The function readtemp returns the integer value of the sensor
        DSdata = readtemp

        LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_1: DisplayInformation ( 2 )  ; update LCD1
        LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_2: DisplayInformation ( 2 )  ; update LCD2
        DSdata = DSdataRaw ; Set the data
        LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_1: DisplayInformation ( 3 )  ; update LCD1
        DSdata= DSdataRaw ; Set the data
        LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_2: DisplayInformation ( 3 )  ; update LCD2

        ccount++

        wait 1 s

    loop
    End

    Sub DisplayInformation ( LCDCommand )

        Select case LCDCommand

        Case 1
          CLS
          print "GCBASIC 2021"
          locate 1,0
          print "DS18B20 Demo"

        Case 2
           ' Display the integer value of the sensor on the LCD
           locate 0,0
           print hex(ccount)
           print " Ceil"
           locate 0,8
           print DSdata
           print chr(223)+"C"+"  "

         Case 3

           ' Display the integer and decimal value of the sensor on the LCD

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
           print "C"+"  "

        End Select

    end sub
```

<span class="strong">**Key line:**</span>
`LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_1: DisplayInformation ( 1 )` — setting
`LCD_I2C_ADDRESS_Current` before each write is what routes LCD commands
to a specific physical display, allowing up to eight PCF8574 adapters
(each at a distinct I2C address) to be driven independently on the same
bus.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a> — full
    reference for this connection mode, including the address constant
    table
-   <a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a> — the
    alternate Ywmjkdz I2C expander layout mentioned above
-   <a href="ds18b20" class="link" title="DS18B20">DS18B20</a> — reading
    the temperature sensor used in the second example

</div>

</div>
