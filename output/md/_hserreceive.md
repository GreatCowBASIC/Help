<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hserreceive"></span>HSerReceive

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

<span class="strong">**<span class="emphasis">*Used as
subroutine:*</span>**</span>

``` screen
    HSerReceive (user_byte_variable)
```

or, if other multiple comports are in use, set the comport before using
HSerReceive.

``` screen
    comport = 1   '(1|2|3|4|5)Not needed unless using multiple comports in use
    HSerReceive (_user_byte_variable_)
```

or, used as function.

``` screen
  user_byte_variable = HSerReceive  'Supports only USART1
  user_byte_variable = HSerReceive1 'Supports only USART1
  user_byte_variable = HSerReceive2 'Supports only USART2
```

or, used to support assigning of received byte to word (or other
multi-byte variables).  Note the use of casting to ensure the
`HSerReceive` uses byte addressing.

``` screen
  Dim dbAdr as Word

  HSerReceive [byte]dbAdr_H
  HSerReceive [byte]dbAdr
```

For other comports use Function `HSerReceiveFrom`

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a USART or UART module.

Microchip PIC supports USART1,2,3,4 and 5.  
Atmel AVR supports USART 1,2,3 and 4.

<span class="strong">**Enabling Constants:**</span>

To enable the use of the USART these are the enabling constants.   These
constants are required.  You can change the `USART_BAUD_RATE` and to
meet your needs.  For addition USART ports use
`#define USARTn_BAUD_RATE 9600` where `` n` `` is the required port
number.

``` screen
    'USART settings for USART1
    #define USART_BAUD_RATE 9600       'Set the baud rate
    #define USART_TX_BLOCKING          'Ensure the transmit buffer is empty
    #define USART_BLOCKING             'Ensures a data byte is in the receive buffer
    #define USART_DELAY OFF        'Disables USART delays
```

<span class="strong">**Explanation:**</span>

This command will read a byte from the hardware RS232 module. It can be
used either as a subroutine or as a function. If used as a subroutine, a
variable must be supplied to store the received value in. If used as a
function, it will return the received value.

The subroutine HSerReceive can get a byte from any comport but must set
the comport number immediately before the call. If ”\#define
USART\_BLOCKING” is defined then the HserReceive waits in a loop until
it receives a byte. If” \#define USART\_BLOCKING” is NOT defined then
HserReceive returns the new byte that was received OR returns 255
because of “DefaultUsartReturnValue = 255” was defined. This is good
because it don’t hold up your program from executing other commands and
your can check it for new data priodically.

<span class="strong">**Example:**</span>

``` screen
  'This program will read a value from the USART, and send it to PORTB.

  #chip 16F877A, 20

  'USART settings
  #define USART_BAUD_RATE 9600  'sets up comport 1 for 9600 baud

  'Set PORTB to output
  Dir PORTB Out
  'Set USART receive pin to input
  Dir PORTC.7 In

  'Main loop
  Do
    'Get serial data and output value to PortB as 8 bit binary
    HSerReceive(InChar)  'Receive data as Subroutine from comport 1
    'InChar = HSerReceive  'Could also be written as Function
    If InChar <> 255 Then   'If value is 255 then it is old data
      PortB = InChar    'If new data then it goes to PortB
    End If
  Loop
```

<span class="strong">**Example 2:**</span>

``` screen
  'If you choose no “Blocking” and comment both of them out.
  'USART settings
  #define USART_BAUD_RATE 9600
  '#define USART_BLOCKING        ' just none OR one of the blocking
  '#define USART_TX_BLOCKING    ' statements should be defined

  'Main loop
  Do
    'Get and display value
    'If there is no new data, HSerReceive will return default value.
    comport = 1
    HSerReceive tempvalue
    If tempvalue <> 255    Then    ‘ don’t change PortB if it is default
      PortB = tempvalue
    End If

  Loop
```

<span class="strong">**Example 3:**</span>

``` screen
  'If you choose no “Blocking” and comment both of them out.
  #chip mega328p, 16

  #define USART_BAUD_RATE 9600
  '#define USART_BLOCKING
  '#define USART_TX_BLOCKING

  'Don't forget to Set usart pin directions
  Dir PortD.1 Out    'com1   USART0
  Dir PortD.0 In

  Wait 1 s

  'Message after reset
  HSerPrint "ATmega328P  com test"
  HSerPrintCRLF

  'Main routine  hook up FTDI232 usb to serial and use terminal program to check
  Start:
    comport = 1
    HSerReceive(InChar)    'Subroutine needs the comport set
    'InChar = HSerReceive    ' This function will get from comport 1
      If InChar <> 255 Then    ' check if for received byte
                  'return 255 if old data
        HSerSend InChar    'send back char to UART
      End If
  Goto Start
```

<span class="strong">**See also**</span>
<a href="_rs232_hardware_overview.html" class="link" title="RS232 Hardware Overview">RS232 Hardware Overview</a>

</div>
