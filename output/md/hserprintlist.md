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
    HSerPrintList [comport], value1, value2 [, value3 ... ]
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Note

In the second form, the `[comport]` square brackets are literal
characters you type exactly as shown. This is different from the
`[, value3 …​ ]` further along the first line, which (following the
usual convention in this manual) means that part is optional and is not
typed.

</div>

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

An optional leading `[comport]` argument sends every value in the list
to that comport instead of the default. `comport` must be a number or a
defined constant, and a comma must follow the closing `]` -
`HSerPrintList [2] a, b` (no comma) is rejected with a compile error
rather than silently accepted. Internally this passes the comport
straight through to
`` HSerPrint’s own existing comport parameter on each expanded call (`HSerPrint value, comport ``),
so `HSerPrintList [2], a, b` is exactly equivalent to writing
`HSerPrint a, 2` and `HSerPrint b, 2` by hand. This comport argument is
not available on `Ser1PrintList`, `Ser2PrintList` or `Ser3PrintList`,
since a software-serial channel has no comport to select.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Note

The compiler merges a repeated, identical comport setup across
consecutive expanded calls, so `HSerPrintList [2], a, b, c` only sets
the comport once in the generated code rather than once per value (PIC
and AVR both). This optimisation is automatically disabled for the whole
program if it defines an `Interrupt` sub, since an interrupt could
otherwise fire between two calls and change the comport for its own
purposes without the compiler being able to see that from this code
alone.

</div>

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

<span class="strong">**Example with a comport:**</span>

``` programlisting
    #chip 16F877A, 20

    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING
    #define USART_DELAY OFF

    #define MyPort 2

    Dim SignalLevel As Byte = 87
    Dim SampleCount As Word = 4213

    Do
      HSerPrintList [MyPort], SignalLevel, ",", SampleCount, 13, 10   ' <<< sends to MyPort (2)
      Wait 1 s
    Loop
```

<span class="strong">**Key line:**</span> every value in the
`HSerPrintList` call is sent to comport 2 (via the `MyPort` constant),
instead of the default comport.

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
