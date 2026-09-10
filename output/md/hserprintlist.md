<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hserprintlist"></span>HSerPrintList

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HSerPrintList value1, value2 [, value3 ... ]
```

<span class="strong">**Command Availability:**</span>

Available anywhere
<a href="hserprint" class="link" title="HSerPrint">HSerPrint</a>
is available.

<span class="strong">**Enabling Constants:**</span>

The same enabling constants as
<a href="hserprint" class="link" title="HSerPrint">HSerPrint</a>
apply.

``` programlisting
    'USART settings for USART1
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING
    #define USART_DELAY OFF
```

<span class="strong">**Explanation:**</span>

`HSerPrintList` sends two or more values in a single statement, instead
of writing one `HSerPrint` call per value. Each `value` can be a string,
integer, long, word or byte, and each is sent using the matching typed
`HSerPrint` call, in the order given, to the default comport. Because
the compiler expands the list into ordinary `HSerPrint` calls, mixing
types in one statement — a string, then a byte, then a word, and so
on — works exactly as if each value had been sent with its own
`HSerPrint` statement.

`HSerPrintList` does not send any new line characters. As with
`HSerPrint`, follow the statement with `HSerPrint 13` and `HSerPrint 10`
if the receiving terminal needs a new line.

There is no comport argument; a value that must go to a specific comport
should still be sent with `HSerPrint(user_value, comport)`.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F877A, 20

    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING
    #define USART_DELAY OFF

    Dim Txt_Heading As String * 12 = "K9AY North"
    Dim SignalLevel As Byte = 87
    Dim SampleCount As Word = 4213

    Do
      HSerPrintList "{STAT,", Txt_Heading, ",", SignalLevel, ",", SampleCount, "}", 13, 10   ' <<< the HSerPrintList instruction
      Wait 1 s
    Loop
```

<span class="strong">**Key line:**</span> the single `HSerPrintList`
call above sends a string literal, a string variable, another string
literal, a byte, another string literal, a word, a closing brace and a
CR/LF pair — nine values in total — as nine typed `HSerPrint` calls,
without writing any of them out by hand.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hserprint" class="link" title="HSerPrint">HSerPrint</a> — sending
    a single value, or a value to a specific comport
-   <a href="hsersendbytes" class="link" title="HSerSendBytes">HSerSendBytes</a> — sending
    2 to 16 raw bytes in one call, rather than typed values
-   <a href="sernprintlist" class="link" title="SerNPrintList">Ser1PrintList, Ser2PrintList, Ser3PrintList</a> — the
    same mixed-type list, on a software-serial channel

</div>

</div>
