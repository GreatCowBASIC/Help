<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="integertostring"></span>IntegerToString

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = IntegerToString(Integer_variable)     'supports Integer.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `IntegerToString` function converts a number into a string. `number`
can be any Integer variable, or a fixed number constant between -32768
and 32767 inclusive. For Byte numbers use `ByteToString()`, for Word
numbers use `WordToString()`, for Long numbers use `LongToString()`, and
for Single numbers use `SingleToString()`.

The string variable `stringvar` contains the same number, represented as
a string. The length of the string returned is 9 characters.

This function is especially useful if a number needs to be added to the
end of a string, or if a custom data-sending routine only supports the
output of string variables.  
  
This function does not support conversion of hexadecimal number
strings.  
  
<span class="strong">**Note:**</span> When calling `IntegerToString()`,
do not leave a space between the function name and the opening
parenthesis — doing so produces a compiler error that is not obvious to
diagnose.

``` programlisting
    ' use this -- no space between IntegerToString and the opening parenthesis
    IntegerToString(number_variable)

    ' do not use this -- note the space before the parenthesis
    IntegerToString (number_variable)
```

<span class="strong">**Example 1:**</span>

``` programlisting
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING

    Dim SensorReading as Integer

    'Take an A/D reading
    SensorReading = ReadAD10(AN0)

    'Create a string variable
    Dim OutVar As String

    'Fill string with sensor reading
    OutVar = IntegerToString(SensorReading)          ' <<< the IntegerToString instruction

    'Send
    HSerPrint OutVar
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span>
`OutVar = IntegerToString(SensorReading)` — converts the signed integer
ADC reading into a decimal string, ready to be transmitted over the
serial connection with `HSerPrint`.

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
    dim Integervar as Integer

    ; ----- Main body of program commences here.
    Integervar = -10

    do
       wait 100 ms

       HSerPrint IntegerToString( Integervar )          ' <<< the IntegerToString instruction
       HSerPrintCRLF
       wait 1 s
    loop
    end
```

<span class="strong">**Key line:**</span>
`HSerPrint IntegerToString( Integervar )` — converts the negative
Integer value -10 to a string and prints it directly, without needing an
intermediate string variable.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bytetostring" class="link" title="ByteToString">ByteToString</a>
-   <a href="wordtostring" class="link" title="WordToString">WordToString</a>
-   <a href="longtostring" class="link" title="LongToString">LongToString</a>
-   <a href="singletostring" class="link" title="SingleToString">SingleToString</a>

</div>

</div>
