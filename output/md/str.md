<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="str"></span>Str

</div>

</div>

</div>

<span class="strong">**Syntax: Deprecated — use ByteToString()**</span>

``` screen
    stringvar = Str(number)     'supports decimal byte and word strings only.

    'Use the following to support decimal long number strings.
    stringvar = Str32(long number)     'supports decimal long number strings.

    'Use the following to support decimal integer number strings.
    stringvar = StrInteger(integer number)     ' decimal integer number strings.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Str` function converts a number into a string. `number` can be any
byte or word variable, or a fixed number between 0 and 65535 inclusive.
For Long numbers use `Str32`, and for Integer numbers use `StrInteger`.

The string variable `stringvar` contains the same number, represented as
a string. The length of the string returned is 5, 10, or 6 characters
for Byte/Word, Long, and Integer respectively.

This function is especially useful if a number needs to be added to the
end of a string, or if a custom data-sending routine only supports the
output of string variables.  
  
These functions do not support conversion of hexadecimal number
strings.  
  
<span class="strong">**Note:**</span> When calling `Str()`, do not leave
a space between the function name and the opening parenthesis — doing so
produces a compiler error that is not obvious to diagnose.

``` programlisting
    ' use this -- no space between STR and the opening parenthesis
    STR(number_variable)

    ' do not use this -- note the space before the parenthesis
    STR (number_variable)
```

<span class="strong">**Example 1:**</span>

``` programlisting
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
    OutVar = Str(SensorReading)          ' <<< the Str instruction

    'Send
    HSerPrint OutVar
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span>
`OutVar = Str(SensorReading)` — converts the byte- or word-sized ADC
reading into a decimal string, ready to be transmitted over the serial
connection with `HSerPrint`.

<span class="strong">**Example 2:**</span>

``` programlisting
    '''************************************************************************
    '''  PIC: 16F18855
    '''  Compiler: GCB
    '''  IDE: GCode
    '''  Board: Xpress Evaluation Board
    '''  Date: June 2021

    ' ----- Configuration
      'Chip Settings.
      #chip 16f18855,32
      #Config CLRE_ON
      #option Explicit

    ; ----- Define Hardware settings

      'Set the PPS of the RS232 ports.
      UNLOCKPPS
        RC0PPS = 0x0010     'RC0->EUSART:TX;
        RXPPS  = 0x0011     'RC1->EUSART:RX;
      LOCKPPS

    ; ----- Constants
      #define USART_BAUD_RATE 19200
      #define USART_TX_BLOCKING

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

       HSerPrint str( bytevar )          ' <<< the Str instruction
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
```

<span class="strong">**Key line:**</span>
`HSerPrint str( bytevar )` — converts the byte value 0xff with the
deprecated `Str` function; the same loop also demonstrates the related
`Str32` and `StrInteger` forms for Long and Integer values.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hex" class="link" title="Hex">Hex</a>
-   <a href="val" class="link" title="Val">Val</a>
-   <a href="bytetostring" class="link" title="ByteToString">ByteToString</a> — the
    modern replacement for `Str`

</div>

</div>
