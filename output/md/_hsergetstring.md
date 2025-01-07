<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hsergetstring"></span>HSerGetString

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HSerGetString myString      ‘Get a multi char string  from USART 1
    HSerGetString myString,1    ‘Get a multi char string  from USART 1
    HSerGetString myString,2    ‘Get a multi char string  from USART 2
```

``` literallayout
Variable type is string and the  routine checks for numbers,letters, and puctuation.
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

This command will read a multi character string received as ascii input
to the hardware serial module followed by a CR from an external serial
source. It can be used only as a subroutine. Variable type is string and
the routine checks for numbers,letters, and puctuation.

<span class="strong">**Example:**</span>

``` screen
  'This program receives char string and CR from a PC terminal, sends back the string on the serial port, and turns Led’s on off by command

  #chip 18f26k22, 16

  'Set the pin directions
  #define USART_BAUD_RATE 9600
  #define USART_BLOCKING
  #define USART2_BAUD_RATE 9600
  #define USART2_BLOCKING

  'InitUSART
  #define SerInPort PORTc.7    'USART 1 Rx Pin
  #define SerOutPort PORTc.6    'USART 1 Tx Pin


  'Set pin directions
  Dir SerOutPort Out
  Dir SerInPort In

  Dir PORTB.6 Out        'second USART Tx Pin
  Dir PORTB.7 In        'second USART Rx Pin

  Dir PORTB.0 Out        ' LED hooked up for testing
  Dir PORTB.1 Out        ' LED hooked up for testing

  Wait 100 Ms

  ; ----- Variables
  ' All byte variables are defined upon use.
  Dim myNum as Word
  Dim MyString as String

  ; ----- Main body of program commences here.
  'Message after reset
  HSerPrint "18F26k22"
  HSerPrintCRLF

  'Main routine

  Do Forever

    HSerGetString MyString
    HSerPrint MyString
    HSerSend(13)
     If MyString = "LED1 ON" Then
       Set PORTB.0 Off
     End If
     If MyString = "LED1 OFF" Then
       Set PORTB.0 On
     End If
     If MyString = "LED2 ON" Then
       Set PORTB.1 Off
     End If
     If MyString = "LED2 OFF" Then
       Set PORTB.1 On
     End If

  Loop
```

<span class="strong">**See also**</span>
<a href="_hserreceive.html" class="link" title="HSerReceive">HSerReceive</a>
and
<a href="_hsergetnum.html" class="link" title="HSerGetNum">HSerGetNum</a>

</div>
