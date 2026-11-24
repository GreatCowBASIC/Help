<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="serreceive"></span>SerReceive

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  SerReceive channel, output
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command will read a byte from the RS232 channel given by `channel`
according to the rules set using `InitSer`, and store the received byte
in the variable `output`.

<span class="strong">**Example:**</span>

``` programlisting
  'This program will read a byte from PORTB.2, and set the LED on if
  'the byte is more than 50. This can be used with the SerSend
  'example program.

  #chip 16F88, 8

  #define RecAHigh PORTB.2 ON
  #define RecALow PORTB.2 OFF
  #define LED PORTB.0

  Dir PORTB.0 Out
  Dir PORTB.2 In

  InitSer 1, r9600, 1 + WaitForStart, 8, 1, none, normal
  Do
    SerReceive 1, Temp          ' <<< the SerReceive instruction
    If Temp <= 50 Then Set LED Off
    If Temp > 50 Then Set LED On
  Loop
```

<span class="strong">**Key line:**</span> `SerReceive 1, Temp` — blocks
until a byte arrives on software-UART channel 1, then stores it in
`Temp`, using the bit rate, start/stop bits and parity previously
configured by `InitSer` on that same channel.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="rs232_software_overview" class="link" title="RS232 Software Overview">RS232 Software Overview</a> — category
    overview
-   <a href="initser" class="link" title="InitSer">InitSer</a> — configures
    the channel before SerReceive can be used
-   <a href="sersend" class="link" title="SerSend">SerSend</a> — the
    counterpart command for sending a byte

</div>

</div>
