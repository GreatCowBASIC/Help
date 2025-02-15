<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="val"></span>Val

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    var = Val(string)   'Supports decimal byte and word strings only.

    'use the following for strings that represent Long numbers
    var = Val32(string)   'Supports decimal long number strings only.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Val` function will extract a number from a string variable, and
store it in a word variable. One potential use is reading numbers that
are sent in ASCII format over a serial connection.  
  
The `Val32` function will extract a long number from a string variable,
and store it in a long variable.

  
  
The `Val` function will not extract a value from a hexadecimal string.  
  

<span class="strong">**Example1:**</span>

``` screen
    'Program for an RS232 controlled dimmer
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING


    'Set pin directions for USART and PWM

    'Variable for output level
    Dim OutputLevel As Word

    'Variables for received bytes
    Dim DataIn As String
    DataInCount = 0

    'Main Loop
    Do
        'Get serial byte
        Wait Until USARTHasData
        HSerReceive InByte

        'Process latest byte
        'Enter key?
        If InByte = 13 Then
            'Convert output level to numeric variable
            OutputLevel = Val(DataIn)

            'Output
            HPWM 1, 32, OutputLevel

            'Clear output buffer for next command
            DataIn = ""
            DataInCount = 0
        End If

        'Number?
        If InByte >= 48 and InByte <= 57 Then
            'Add to end of DataIn string
            DataInCount += 1
            DataIn(DataInCount) = InByte
            DataIn(0) = DataInCount
        End If
    Loop
```

  
  

<span class="strong">**Example2:**</span>

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

         bytevar = Val( "255" )
         HSerPrint bytevar
         HSerPrintCRLF

         wordvar = Val( "65535" )
         HSerPrint wordvar
         HSerPrintCRLF

         longvar = Val32( "65536" )
         HSerPrint longvar
         HSerPrintCRLF 2

         wait 1 s
      loop
    end

  ; ----- Support methods.  Subroutines and Functions
```

<span class="strong">**See Also**</span>
<a href="hex" class="link" title="Hex">Hex</a>,
<a href="str" class="link" title="Str">Str</a>

</div>
