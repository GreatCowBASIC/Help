<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="singletostring"></span>SingleToString

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = SingleToString(Single_variable)     'supports Single.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `SingleToString` function converts a number into a string. `number`
can be any Single variable. For Byte numbers use `ByteToString()`, for
Word numbers use `WordToString()`, for Integer numbers use
`IntegerToString()`, and for Long numbers use `LongToString()`.

The string variable `stringvar` contains the ASCII representation of the
input number. The string length is variable, depending on the input
value.

This function is especially useful if a number needs to be added to the
end of a string, or if a custom data-sending routine only supports the
output of string variables.  
  
This function does not support conversion of hexadecimal number
strings.  
  

<span class="strong">**Operational Return Codes**</span>

The function returns either the number string or the message `"Error "`.
The reasons for an `"Error "` result are:

<div class="itemizedlist">

-   A very small number that actually computes as 0.0
-   The input value is too large
-   Too many characters — out of range

</div>

A public variable is available after using this function:
`SysByte_STS_Err`, which returns the following:

    \`SysByte\_STS\_Err\` where 1 or 9 equates to no error.

    1 equates to a properly formatted number string.

    8 equates to a properly formatted integer number string.

<span class="emphasis">*Bitwise Return Details*</span>

``` programlisting
    SysByte_STS_Err.0 :  1 = good, or, 0 = bad
    SysByte_STS_Err.1 :  1 = too many decimal-place characters, or, 0 = ok
    SysByte_STS_Err.2 :  1 = too many integer-place characters (out of range), or, 0 = ok
    SysByte_STS_Err.3 :  1 = no decimal point, info only
    SysByte_STS_Err.4 :  1 = non-numeric characters found
```

<span class="strong">**Note:**</span> When calling `SingleToString()`,
do not leave a space between the function name and the opening
parenthesis — doing so produces a compiler error that is not obvious to
diagnose.

``` programlisting
    ' use this -- no space between SingleToString and the opening parenthesis
    SingleToString(number_variable)

    ' do not use this -- note the space before the parenthesis
    SingleToString (number_variable)
```

<span class="strong">**Example 1:**</span>

``` programlisting
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING

    Dim SensorReading as Single

    'Take an A/D reading
    SensorReading = ReadAD(AN0)

    'Create a string variable
    Dim OutVar As String

    'Fill string with sensor reading
    OutVar = SingleToString(SensorReading)          ' <<< the SingleToString instruction

    'Send
    HSerPrint OutVar
    HSerPrintCRLF

    Do
    Loop

    End
```

<span class="strong">**Key line:**</span>
`OutVar = SingleToString(SensorReading)` — converts the floating-point
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
    dim Singlevar as Single

    ; ----- Main body of program commences here.
    Singlevar = -10

    do
       wait 100 ms

       HSerPrint SingleToString( Singlevar )          ' <<< the SingleToString instruction
       HSerPrintCRLF
       wait 1 s
    loop

    end
```

<span class="strong">**Key line:**</span>
`HSerPrint SingleToString( Singlevar )` — converts the Single value -10
to a string and prints it directly, without needing an intermediate
string variable.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bytetostring" class="link" title="ByteToString">ByteToString</a>
-   <a href="wordtostring" class="link" title="WordToString">WordToString</a>
-   <a href="longtostring" class="link" title="LongToString">LongToString</a>
-   <a href="integertostring" class="link" title="IntegerToString">IntegerToString</a>

</div>

</div>
