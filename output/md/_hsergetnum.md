<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hsergetnum"></span>HSerGetNum

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  HSerGetNum myNum    ‘Gets a multi digit number  from USART 1
  HSerGetNum myNum,1  ‘Get a multi digit number from USART 1
  HSerGetNum myNum,2  ‘Get a multi digit number from USART 2
```

``` literallayout
When the variable type is a word the number range is 0 to 65535
When the variable type is a long the number range is 0 to 99999
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a USART or UART module.  

Microchip PIC supports USART1 and 2.  
Atmel AVR supports USART 1,2,3 and 4.

<span class="strong">**Enabling Constants:**</span>

To enable the use of the USART these are the enabling constants.   These
constants are required.  You can change the `USART_BAUD_RATE` and to
meet your needs.  For addition USART ports use
`#define USARTn_BAUD_RATE 9600` where `` n` `` is the required port
number.

``` screen
    'USART settings for USART1
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING
    #define USART_DELAY OFF
```

<span class="strong">**Explanation:**</span>

This command will read a multi digit number received as ascii chars
followed by a CR from an external serial source using a hardware serial
module. The command checks that only numbers are input disregarding
other characters while waiting for the ending &lt;CR&gt;. It can be used
only as a subroutine.

<span class="strong">**Example:**</span>

``` screen
  'This program receives a number and CR from a PC terminal and sends it back on both usarts
  #chip 18f26k22, 16

  'Set the pin directions
  #define USART_BAUD_RATE 9600
  #define USART_BLOCKING
  #define USART2_BAUD_RATE 9600
  #define USART2_BLOCKING

  'Init pins
  #define SerInPort PORTc.7    'usart1 in
  #define SerOutPort PORTc.6    'usart2 out
    'Set pin directions
    Dir SerOutPort Out
    Dir SerInPort In
    Dir PORTB.6 Out            'USART2 out
    Dir PORTB.7 In            'USArt2 in
    Dir PORTB.0 Out            'leds for testing
    Dir PORTB.1 Out            'leds for testing
    Wait 100 Ms

  'Variables
  Dim myNum as Word
  'Main body of program commences here.
  'Message after reset
  HSerPrint "18F26k22"
  HSerPrintCRLF

  'Main routine
  Do forever
    'wait for char from UART
    'HSerReceive InChar
    HSerGetNum myNum,2    'from usart 2
    HSerPrint myNum,1            ' send out usart 1
    HSerPrint myNum,2        'send out usart 2
    HSerPrintCRLF 1,2        'send one CRLF out usart 2
    HserPrintCRLF 1,1        ‘send one CRLF out usart 1
  loop
```

<span class="strong">**Example:**</span> This program receives number on
serial port 1 and displays. This example shows using a Long as the input
variable.

Therefore, the result is in the range of 0-99999. The example also shows
how to detect a buffer overrun by testing the HSerInByte variable.

``` screen
    #chip mega328p, 16

    #define USART_BAUD_RATE 9600
    #define USART_BLOCKING

    Dim myNum as Long  ' range 0 to 99999
    HSerPrint "Restarted"
    HSerPrintCRLF

    Do
      HSerGetNum myNum
      HSerPrint myNum

      if HSerInByte <> 13 then
          HSerSend 9
          HSerPrint "Error buffer overrun"  'You should handle error appropiately
      End if
      HSerPrintCRLF
    loop
    End
```

<span class="strong">**See also**</span>
<a href="_hserreceive.html" class="link" title="HSerReceive">HSerReceive</a>
and
<a href="_hsergetstring.html" class="link" title="HSerGetString">HSerGetString</a>

</div>
