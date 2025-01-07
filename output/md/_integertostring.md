<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_integertostring"></span>IntegerToString

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = IntegerToString(Integer_variable)     'supports Integer.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `IntegerToString` function will convert a number into a string.
`number` can be any Integer variable, or a fixed number constant between
0 and 4294967295 inclusive.  For Byte number use `ByteToString()`, Word
numbers use `WordToString()`, for Integer numbers use
`IntegerToString()` and for Single numbers use `SingleToString()`

The string variable `stringvar` will contain the same number,
represented as a string.  The length of the string returned is 9
characters.

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

    Dim SensorReading as Integer

    'Take an A/D reading
    SensorReading = ReadAD10(AN0)

    'Create a string variable
    Dim OutVar As String

    'Fill string with sensor reading
    OutVar = IntegerToString(SensorReading)

    'Send
    HSerPrint OutVar
    HSerPrintCRLF

    When using the functions IntegerToString() do not leave space between the function
    call and the left brace. You will get a compiler error that is
    meaningless.

    ' use this, note this is no space between the IntegerToString() and the left brace!
    IntegerToString(number_variable)
    ' do not use, note the space!
    IntegerToString (number_variable)
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

       HSerPrint IntegerToString( Integervar )
       HSerPrintCRLF
       wait 1 s
    loop
    end

; ----- Support methods.  Subroutines and Functions
```

  
  
<span class="strong">**See Also**</span>
<a href="_bytetohex.html" class="link" title="ByteToHex">ByteToString</a>,
<a href="_wordtohex.html" class="link" title="WordToHex">WordToString</a>,
<a href="_longtohex.html" class="link" title="LongToHex">LongToString</a>,
<a href="_singletohex.html" class="link" title="SingleToHex">SingleToString</a>,
<a href="_bytetohex.html" class="link" title="ByteToHex">ByteToHex</a>

</div>
