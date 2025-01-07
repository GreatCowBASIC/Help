<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hsersend"></span>HSerSend

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HSerSend user_byte [,1|2|3|4]   'Choose comport with optional parameter
                                      'Default comport is 1
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

This command will send a byte given by <span
class="emphasis">*user\_byte*</span> using the hardware RS232 module.

<span class="strong">**Example:**</span>

``` screen
  'This program will send the status of PORTB through the hardware
  'serial module.

  #chip 16F877A, 20

  'USART settings
  #define USART_BAUD_RATE 9600  'Initializes USART port with 9600 baud
  '#define USART_BLOCKING   ' Both of these blocking statements will
  #define USART_TX_BLOCKING ' wait for tx register to be empty
                ' use only one of the two constants
  #define USART_DELAY OFF

  'Set PORTB to input
  Dir PORTB In
  'Set USART transmit pin to output
  Dir PORTC.6 Out

  'Main loop
  Do
    'Send PORTB value through USART
    HSerSend PORTB
    HSerSend(13)    ' sends a CR
    'Short delay for receiver to process message
    Wait 10 ms      'probably not necessary with blocking statement
  Loop
```

</div>
