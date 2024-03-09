<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="str"></span>Str

</div>

</div>

</div>

<span class="strong">**Syntax: Deprecated use ByteToString()**</span>

``` screen
    stringvar = Str(number)     'supports decimal byte and word strings only.

    'Use the following to support decimal long number strings.
    stringvar = Str32(long number)     'supports  decimal long number strings.

    'Use the following to support decimal integer number strings.
    stringvar = StrInteger(integer number)     ' decimal integer number strings.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Str` function will convert a number into a string. `number` can be
any byte or word variable, or a fixed number between 0 and 65535
inclusive.  For Long numbers use `Str32` and for Integer numbers use
`StrInteger`.

The string variable `stringvar` will contain the same number,
represented as a string.  The length of the string returned is 5, 10 or
6 characters for Byte & Word, Long and Integer respectively.

This function is especially useful if a number needs to added to the end
of a string, or if a custom data sending routine has been created but
only supports the output of string variables.  
  
These methods will not support conversion of hexadecimal number
strings.  
  
<span class="strong">**Example1:**</span>

``` screen
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING


    'Take an A/D reading
    SensorReading = ReadAD(AN0)

    'Create a string variable
    Dim OutVar As String

    'Fill string with sensor reading
    OutVar = Str(SensorReading)

    'Send
    HSerPrint OutVar
    HSerPrintCRLF

    When using the functions STR() do not leave space between the function
    call and the left brace. You will get a compiler error that is
    meaningless.

    ' use this, note this is no space between the STR and the left brace!
    STR(number_variable)
    ' do not use, note the space!
    STR (number_variable)
```

  
  
<span class="strong">**Example2:**</span>

``` screen
    '''
    '''
    '''
    '''
    '''************************************************************************
    '''
    '''  PIC: 16F18855
    '''  Compiler: GCB
    '''  IDE: GCode
    '''
    '''  Board: Xpress Evaluation Board
    '''  Date: June 2021
    '''
    ' ----- Configuration
      'Chip Settings.
      #chip 16f18855,32
      #Config CLRE_ON
      #option Explicit

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
    dim integervarP, integervarN,integervar as Integer

    ; ----- Main body of program commences here.
    bytevar = 0xff
    wordvar = 0xffff
    longvar = 0xffffffff
    integervarP = 127
    integervarN = -127
    integervar = 0

    do
       wait 100 ms

       HSerPrint str( bytevar )
       HSerPrintCRLF
       HSerPrint str( wordvar )
       HSerPrintCRLF
       HSerPrint str32( longvar )
       HSerPrintCRLF
       HSerPrint StrInteger( integervarP )
       HSerPrintCRLF
       HSerPrint StrInteger( integervarN )
       HSerPrintCRLF
       HSerPrint StrInteger( integervar )
       HSerPrintCRLF
       wait 100 ms
       HSerPrintCRLF

       wait 1 s
    loop
    end

; ----- Support methods.  Subroutines and Functions
```

  
  
<span class="strong">**See Also**</span>
<a href="hex" class="link" title="Hex">Hex</a>,
<a href="val" class="link" title="Val">Val</a>

</div>
