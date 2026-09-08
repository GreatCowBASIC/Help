<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hsersendbytes"></span>HSerSendBytes

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HSerSendBytes(byte1, byte2 [, byte3 ... up to byte16])
```

<span class="strong">**Command Availability:**</span>

Available anywhere
<a href="hsersend" class="link" title="HSerSend">HSerSend</a> is
available, once `usart.h` has been loaded.

<span class="strong">**Enabling Constants:**</span>

The same enabling constants as
<a href="hsersend" class="link" title="HSerSend">HSerSend</a>
apply.

``` programlisting
    'USART settings for USART1
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING
    #define USART_DELAY OFF
```

<span class="strong">**Explanation:**</span>

`HSerSendBytes` sends between 2 and 16 bytes in a single call, in the
order given, instead of writing one `HSerSend` call per byte. Each byte
is sent to the default or currently configured comport; there is no
comport argument, so a byte that must go to a specific comport should
still be sent with `HSerSend(user_byte, comport)`.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F877A, 20

    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING
    #define USART_DELAY OFF

    Dir PORTC.6 Out

    Do
      HSerSendBytes(1, 2, 3)   ' <<< the HSerSendBytes instruction
      HSerSend(13)             ' sends a CR
      Wait 100 ms
    Loop
```

<span class="strong">**Key line:**</span>
`HSerSendBytes(1, 2, 3)` — sends the three bytes `1`, `2` and `3`, in
that order, in a single call.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hsersend" class="link" title="HSerSend">HSerSend</a> — sending
    a single byte, or a byte to a specific comport
-   <a href="hserprint" class="link" title="HSerPrint">HSerPrint</a> — sending
    a string, integer, word, or long, rather than raw bytes
-   <a href="dir" class="link" title="Dir">Dir</a> — setting the
    pin directions before sending, as used above

</div>

</div>
