<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="longtostring"></span>LongToString

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = LongToString(Long_variable)     'supports Long.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `LongToString` function converts a number into a string. `number`
can be any Long variable, or a fixed number constant between 0 and
4294967295 inclusive. For Byte numbers use `ByteToString()`, for Word
numbers use `WordToString()`, for Integer numbers use
`IntegerToString()`, and for Single numbers use `SingleToString()`.

The string variable `stringvar` contains the same number, represented as
a string. The length of the string returned is 10 characters.

This function is especially useful if a number needs to be added to the
end of a string, or if a custom data-sending routine only supports the
output of string variables.  
  
This function does not support conversion of hexadecimal number
strings.  
  
<span class="strong">**Note:**</span> When calling `LongToString()`, do
not leave a space between the function name and the opening
parenthesis — doing so produces a compiler error that is not obvious to
diagnose.

``` programlisting
    ' use this -- no space between LongToString and the opening parenthesis
    LongToString(number_variable)

    ' do not use this -- note the space before the parenthesis
    LongToString (number_variable)
```

<span class="strong">**Example 1:**</span>

``` programlisting
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING

    Dim SensorReading as Long

    'Take an A/D reading
    SensorReading = ReadAD12(AN0)

    'Create a string variable
    Dim OutVar As String

    'Fill string with sensor reading
    OutVar = LongToString(SensorReading)          ' <<< the LongToString instruction

    'Send
    HSerPrint OutVar
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span>
`OutVar = LongToString(SensorReading)` — converts the long-sized ADC
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
    dim Longvar as Long

    ; ----- Main body of program commences here.
    Longvar = 0xffffffff

    do
       wait 100 ms

       HSerPrint LongToString( Longvar )          ' <<< the LongToString instruction
       HSerPrintCRLF
       wait 1 s
    loop
    end
```

<span class="strong">**Key line:**</span>
`HSerPrint LongToString( Longvar )` — converts the maximum Long value
0xffffffff to a string and prints it directly, without needing an
intermediate string variable.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bytetostring" class="link" title="ByteToString">ByteToString</a>
-   <a href="wordtostring" class="link" title="WordToString">WordToString</a>
-   <a href="integertostring" class="link" title="IntegerToString">IntegerToString</a>
-   <a href="singletostring" class="link" title="SingleToString">SingleToString</a>

</div>

</div>
