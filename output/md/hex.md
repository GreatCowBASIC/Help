<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hex"></span>Hex

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = Hex(number)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Hex` function converts a number into hexadecimal format. The input
`number` should be a byte variable, or a fixed number between 0 and 255
inclusive. After running the function, the string variable `stringvar`
contains a 2-digit hexadecimal number.

For other variable types, use the type-specific variant instead:
`WordToHex`, `LongToHex`, `IntegerToHex`, or `SingleToHex`.

<span class="strong">**Example:**</span>

``` programlisting
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING


    'Send EEPROM data over serial connection
    'Uses Hex to display as hexadecimal
    For CurrentLocation = 0 to 255
        'Send location
        HSerPrint Hex(CurrentLocation)          ' <<< the Hex instruction
        HSerPrint ":"
        'Read byte and send
        EPRead CurrentLocation, CurrByte
        HSerPrint Hex(CurrByte)
        'Send carriage return/line feed
        HSerPrintCRLF
    Next
```

<span class="strong">**Key line:**</span>
`Hex(CurrentLocation)` — formats the current byte address as a fixed
2-digit hex string, so addresses line up neatly in the terminal output
regardless of their value.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="str" class="link" title="Str">Str</a>
-   <a href="val" class="link" title="Val">Val</a>
-   <a href="wordtohex" class="link" title="WordToHex">WordToHex</a> — the
    equivalent conversion for Word variables

</div>

</div>
