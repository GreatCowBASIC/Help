<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hserreceivefrom"></span>HSerReceiveFrom

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  user_byte = HSerReceiveFrom [,1 | 2 | 3 | 4]
  user_byte = HSerReceiveFrom         'Defaults to USART1

  'other Receive functions
  user_byte = HSerReceive1    'from USART1
  user_byte = HSerReceive2    'from USART2
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

This command will read a byte from the hardware RS232 module. It can be
only be used as a function. It will return the received value.

<span class="strong">**Example:**</span>

``` programlisting
  'This program will read a value from the USART, and display it on PORTB.

  #chip 16F877A, 20

  'USART settings
  #define USART_BAUD_RATE 9600
  #define USART_BLOCKING
  #define USART_TX_BLOCKING


  'Set PORTB to input
  Dir PORTB Out
  'Set USART receive pin to input
  Dir PORTC.7 In

  'Main loop
  Do
    'Get byte value
    bytein = HSerReceiveFrom (2)          ' <<< the HSerReceiveFrom instruction
    'do something useful
  Loop
```

<span class="strong">**Key line:**</span>
`bytein = HSerReceiveFrom (2)` — reads one byte from USART port 2
specifically (rather than the default port 1), blocking because
`USART_BLOCKING` is defined above, and stores the result in `bytein`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hserreceive" class="link" title="HSerReceive">HSerReceive</a> — reading
    from the default USART port without specifying a port number
-   <a href="hsersend" class="link" title="HSerSend">HSerSend</a> — the
    sending counterpart to HSerReceiveFrom

</div>

</div>
