<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hserprintcrlf"></span>HserPrintCRLF

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HserPrintCRLF [optional BYTE] [, 1 | 2  | 3 | 4 ]
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a USART or UART module.  

Microchip PIC supports USART1 and 2.+ Atmel AVR supports USART 1,2,3 and
4.

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

This command will send ASCII codes 13 and 10 only using the hardware
RS232 module. ASCII codes 13 and 10 equate to a carriage return and line
feed.

Optionally, you can add a parameter. The number will determine the
number of ASCII codes 13 and 10 set to the hardware RS232 module.

Also you can choose the comport with second optional parameter if it is
not the default comport 1. If there is no first optional parameter then
you must have atleast acomma before it to indicate this is the second
parameter.

<span class="strong">**Examples:**</span>

``` screen
  'This Line will send 1  CR and LF
  HserPrintCRLF    ' Will send a CR & LF to the terminal

  'This Line will send 2  times (CR and LF)
  HserPrintCRLF 2    ' Will send 2 times (CR & LF) to the terminal
            'out of comport 1

  'This Line will send 1  CR and LF
  HserPrintCRLF 1,2    ' Will send a CR & LF out of
            'comport 2 to the terminal
```

<span class="strong">**See also**</span>
<a href="hserprintbytecrlf" class="link" title="HserPrintByteCRLF">HserPrintByteCRLF</a>

</div>
