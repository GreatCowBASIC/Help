<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="singletohex"></span>SingleToHex

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = SingleToHex(number)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `SingleToHex` function converts a Single (floating-point) number
into hexadecimal format, representing its raw 4-byte in-memory encoding
rather than a decimal-to-hex conversion of its numeric value. The input
`number` should be a `Single` variable. After running the function, the
string variable `stringvar` contains an 8-digit hexadecimal number (4
bytes, since a `Single` occupies 32 bits).

<span class="strong">**Example:**</span>

``` programlisting
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING

    Dim CurrSingle As Single
    CurrSingle = 3.14159

    HSerPrint SingleToHex(CurrSingle)          ' <<< the SingleToHex instruction
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span>
`SingleToHex(CurrSingle)` — returns the 8-digit hex representation of
the 4 raw bytes that make up the `Single` value, useful for inspecting
or transmitting a floating-point value byte-for-byte.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bytetohex" class="link" title="ByteToHex">ByteToHex</a>
-   <a href="wordtohex" class="link" title="WordToHex">WordToHex</a>
-   <a href="longtohex" class="link" title="LongToHex">LongToHex</a>
-   <a href="integertohex" class="link" title="IntegerToHex">IntegerToHex</a>

</div>

</div>
