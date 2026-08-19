<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="stringtobyte"></span>StringToByte

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    var = StringToByte(string)   'Supports decimal byte range strings only.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `StringToByte` function will extract a number from a string
variable, and store it in a byte variable. One potential use is reading
numbers that are sent in ASCII format over a serial connection.  
  
The `StringToByte` function will not extract a StringToByte from a
hexadecimal string.  
  

<span class="strong">**Example1:**</span>

``` screen
    ' ----- Configuration
    'Chip Settings.
    #chip 16f18855,32
    #Config MCLRE_ON

    ; ----- Define Hardware settings

    '' -------------------LATA-----------------
    '' Bit#:  -7---6---5---4---3---2---1---0---
    '' LED:   ---------------|D5 |D4 |D3 |D2 |-
    ''-----------------------------------------
    ''

    'Set the PPS of the RS232 ports.
    UNLOCKPPS
      RC0PPS = 0x0010     'RC0->EUSART:TX;
      RXPPS  = 0x0011     'RC1->EUSART:RX;
    LOCKPPS

    ; ----- Constants
    #define USART_BAUD_RATE 19200
    #define USART_TX_BLOCKING

    #define LEDD2 PORTA.0
    #define LEDD3 PORTA.1
    #define LEDD4 PORTA.2
    #define LEDD5 PORTA.3
    Dir     LEDD2 OUT
    Dir     LEDD3 OUT
    Dir     LEDD4 OUT
    Dir     LEDD5 OUT


    #define Potentiometer       PORTA.4
    DIR     Potentiometer In

    #define SWITCH_DOWN         0
    #define SWITCH_UP           1
    #define SWITCH              PORTA.5
    Dir SWITCH                  In

    ; ----- Variables
    dim bytevar as Byte
    dim wordvar as Word
    dim longvar as long

    bytevar = 0
    wordvar = 0
    longvar = 0



    ; ----- Main body of program commences here.

     #option Explicit

     do
         wait 100 ms

         bytevar = StringToByte( "255" )
         HSerPrint bytevar
         HSerPrintCRLF

         wait 1 s
      loop
    end

  ; ----- Support methods.  Subroutines and Functions
```

</div>
