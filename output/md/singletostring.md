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

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `SingleToString` function will convert a number into a string.
`number` can be any Single variable.  For Byte numbers use
`ByteToString()`, Word numbers use `WordToString()`, for Integer numbers
use `IntegerToString()` and for Long numbers use `LongToString()`

The string variable `stringvar` will contain the ACSII representation of
the input number.  The length of the string is variable length dependent
on the input variable value.

This function is especially useful if a number needs to added to the end
of a string, or if a custom data sending routine has been created but
only supports the output of string variables.  
  
These methods will not support conversion of hexadecimal number
strings.  
  

<span class="strong">**Operational Returned Controls**</span>

The function returns either the number string or the message "Error
".  The reasons for "Error " are:

<div class="itemizedlist">

-   Very small number that actaully compute as 0.0
-   The input values is too large
-   Too many chars-out of range

</div>

There is a public variable available after using this
function.  \`SysByte\_STS\_Err\` - this variable returns the following:

    SysByte\_STS\_Err where 1 or 9 equates to no error.

    1 equates to a properly formatted number string.

    8 equateq to a properly formatted integer number string.

<span class="emphasis">*Bitwise returned details*</span>

``` literallayout
SysByte_STS_Err.0 :  1 = good, or, 0 = bad
SysByte_STS_Err.1 :  1 = decimals places to many chars, or, 0 = ok
SysByte_STS_Err.2 :  1 = integer places to many chars-out of range, or, 0 = ok
SysByte_STS_Err.3 :  1 = no decimal point, info only
SysByte_STS_Err.4 :  1 = non numeric chars found
```

<span class="strong">**Example Usage 1:**</span>

``` screen
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
    OutVar = SingleToString(SensorReading)

    'Send
    HSerPrint OutVar
    HSerPrintCRLF

    When using the functions SingleToString() do not leave space between the function
    call and the left brace. You will get a compiler error that is
    meaningless.

    ' use this, note this is no space between the SingleToString() and the left brace!
    SingleToString(number_variable)
    ' do not use, note the space!
    SingleToString (number_variable)

    Do
    Loop

    End
```

  
  
<span class="strong">**Example Usage 2:**</span>

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

       HSerPrint SingleToString( Singlevar )
       HSerPrintCRLF
       wait 1 s
    loop

    end
```

  
  
<span class="strong">**See Also**</span>
<a href="bytetohex" class="link" title="ByteToHex">ByteToString</a>,
<a href="wordtohex" class="link" title="WordToHex">WordToString</a>,
<a href="longtohex" class="link" title="LongToHex">LongToString</a>,
<a href="singletohex" class="link" title="SingleToHex">SingleToString</a>,
<a href="bytetohex" class="link" title="ByteToHex">ByteToHex</a>

</div>
