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

    'For strings that represent Long numbers, use StringToLong instead -- see <<_stringtolong,StringToLong>>.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Val` function extracts a number from a string variable and stores
it in a word variable. One potential use is reading numbers that are
sent in ASCII format over a serial connection.  
  
`Val` will not extract a value from a hexadecimal string.  
  
<span class="strong">**Note:**</span> The function for parsing a string
into a Long variable is now named `StringToLong`; see
<a href="stringtolong" class="link" title="StringToLong">StringToLong</a>.
The older name `Val32` still compiles, as it is kept as a
backward-compatible alias for `StringToLong`, but new code should call
`StringToLong` directly.  
  

<span class="strong">**Example 1:**</span>

``` programlisting
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
            OutputLevel = Val(DataIn)          ' <<< the Val instruction

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

<span class="strong">**Key line:**</span>
`OutputLevel = Val(DataIn)` — parses the digits accumulated in `DataIn`
from incoming serial bytes and converts them into the numeric
`OutputLevel` used to drive the PWM output.

<span class="strong">**Example 2:**</span>

``` programlisting
    ' ----- Configuration
    'Chip Settings.
    #chip 16f18855,32
    #Config MCLRE_ON

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

    bytevar = 0
    wordvar = 0



    ; ----- Main body of program commences here.

     #option Explicit

     do
         wait 100 ms

         bytevar = Val( "255" )          ' <<< the Val instruction
         HSerPrint bytevar
         HSerPrintCRLF

         wordvar = Val( "65535" )
         HSerPrint wordvar
         HSerPrintCRLF 2

         wait 1 s
      loop
    end
```

<span class="strong">**Key line:**</span>
`bytevar = Val( "255" )` — parses the decimal digit string "255" into
the byte value 255; the same loop also demonstrates the `Val` form for
Word values. For Long values, use `StringToLong` instead of the legacy
`Val32` alias — see
<a href="stringtolong" class="link" title="StringToLong">StringToLong</a>.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hex" class="link" title="Hex">Hex</a>
-   <a href="str" class="link" title="Str">Str</a>
-   <a href="stringtolong" class="link" title="StringToLong">StringToLong</a> — parses
    a string into a Long variable, replacing the former `Val32` function

</div>

</div>
