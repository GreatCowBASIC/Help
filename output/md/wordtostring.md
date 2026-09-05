<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="wordtostring"></span>WordToString

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = WordToString(Word_variable)     'supports Word.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `WordToString` function will convert a number into a string.
`number` can be any Word variable, or a fixed number constant between 0
and 65535 inclusive.  For Word number use `WordToString()`, Long numbers
use `LongToString()`, for Integer numbers use `IntegerToString()` and
for Single numbers use `SingleToString()`

The string variable `stringvar` will contain the same number,
represented as a string.  The length of the string returned is 5
characters.

This function is especially useful if a number needs to added to the end
of a string, or if a custom data sending routine has been created but
only supports the output of string variables.  
  
These methods will not support conversion of hexadecimal number
strings.  
  
<span class="strong">**Example1:**</span>

``` programlisting
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING

    Dim SensorReading as Word

    'Take an A/D reading
    SensorReading = ReadAD10(AN0)

    'Create a string variable
    Dim OutVar As String

    'Fill string with sensor reading
    OutVar = WordToString(SensorReading)          ' <<< the WordToString instruction

    'Send
    HSerPrint OutVar
    HSerPrintCRLF

    When using the functions WordToString() do not leave space between the function
    call and the left brace. You will get a compiler error that is
    meaningless.

    ' use this, note this is no space between the WordToString() and the left brace!
    WordToString(number_variable)
    ' do not use, note the space!
    WordToString (number_variable)
```

<span class="strong">**Key line:**</span>
`OutVar = WordToString(SensorReading)` — converts the 10-bit ADC reading
into a 5-character string, which `HSerPrint` can then send directly
since it otherwise expects a string argument.

  
  
<span class="strong">**Example2:**</span>

``` programlisting
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
    dim Wordvar as Word

    ; ----- Main body of program commences here.
    Wordvar = 0xffff

    do
       wait 100 ms

       HSerPrint WordToString( Wordvar )          ' <<< WordToString called inline as an HSerPrint argument
       HSerPrintCRLF
       wait 1 s
    loop
    end

; ----- Support methods.  Subroutines and Functions
```

<span class="strong">**Key line:**</span>
`HSerPrint WordToString( Wordvar )` — calling `WordToString` directly
inside `HSerPrint` avoids needing a separate string variable; note the
space in `WordToString (number_variable)` shown as the incorrect form
above — `WordToString(` must have no space before the parenthesis.

  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bytetostring" class="link" title="ByteToString">ByteToString</a> — related
    command in the same category
-   <a href="longtostring" class="link" title="LongToString">LongToString</a> — related
    command in the same category
-   <a href="integertostring" class="link" title="IntegerToString">IntegerToString</a> — related
    command in the same category
-   <a href="singletostring" class="link" title="SingleToString">SingleToString</a> — related
    command in the same category
-   <a href="bytetohex" class="link" title="ByteToHex">ByteToHex</a> — related
    command in the same category

</div>

</div>
