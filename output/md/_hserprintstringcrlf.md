<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hserprintstringcrlf"></span>HSerPrintStringCRLF

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HSerPrintStringCRLF user_string [,1|2|3|4]  'Choose comport with optional parameter
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

`HSerPrintStringCRLF` is used to send a string over the serial
connection. The parameter can only be a string. `HSerPrintStringCRLF` is
very similar to `HserPrint` but `HserPrint` can handle all types of
variables.

The data will be sent out the hardware serial module.

`HSerPrintStringCRLF` will send new line characters:

<span class="strong">**Example:**</span>

``` screen
  'This program will display string over the serial connection.

  'Chip settings
  #chip 18F2525, 8

  'USART settings
  #define USART_BAUD_RATE 9600
  #define USART_TX_BLOCKING

  'Show string message
  HSerPrintStringCRLF "GCBASIC RS232 Test"
  Wait 1 s
```

<span class="strong">**For more help, see also**</span>
<a href="_hserprint.html" class="link" title="HSerPrint">HserPrint</a>,
<a href="_hserprintbytecrlf.html" class="link" title="HserPrintByteCRLF">HserPrintByteCRLF</a>
<span class="strong">**and**</span>
<a href="_hserprintcrlf.html" class="link" title="HserPrintCRLF">HserPrintCRLF</a>

</div>
