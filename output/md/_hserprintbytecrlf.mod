<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hserprintbytecrlf"></span>HserPrintByteCRLF

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  HserPrintByteCRLF  user_data [, 1 | 2  | 3 | 4 ]
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
class="emphasis">*user\_data*</span> using the hardware USART module and
then send the ASCII codes 13 and 10. ASCII codes 13 and 10 equate to a
carriage return and line feed.

<span class="strong">**Example:**</span>

``` screen
  'This program will send the status of PORTB through the hardware serial module.

  HserPrintByteCRLF 65    ' Will print a single A on the terminal
  HserPrintByteCRLF "A"   ' Will print a single A on the terminal
```

<span class="strong">**See also**</span>
<a href="hserprintcrlf" class="link" title="HserPrintCRLF">HserPrintCRLF</a>

</div>
