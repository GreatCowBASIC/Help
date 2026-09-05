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

``` programlisting
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

``` programlisting
  'This program will send the status of PORTB through the hardware serial module.

  HserPrintByteCRLF 65    ' Will print a single A on the terminal          ' <<< the HserPrintByteCRLF instruction
  HserPrintByteCRLF "A"   ' Will print a single A on the terminal
```

<span class="strong">**Key line:**</span> `HserPrintByteCRLF 65` — sends
the byte value 65 (ASCII `A`) followed automatically by a carriage
return and line feed, saving the two separate `HSerSend` calls that
`HserPrintByteCRLF` combines into one.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hserprintcrlf" class="link" title="HserPrintCRLF">HserPrintCRLF</a> — sending
    only the carriage return and line feed, with no data byte
-   <a href="hsersend" class="link" title="HSerSend">HSerSend</a> — sending
    a raw byte with no automatic CR/LF

</div>

</div>
