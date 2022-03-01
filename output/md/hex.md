<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hex"></span>Hex

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = Hex(number)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Hex` function will convert a number into hexadecimal format. The
input `number` should be a byte variable, or a fixed number between 0
and 255 inclusive. After running the function, the string variable
`stringvar` will contain a 2 digit hexadecimal number.

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING


    'Send EEPROM data over serial connection
    'Uses Hex to display as hexadecimal
    For CurrentLocation = 0 to 255
        'Send location
        HSerPrint Hex(CurrentLocation)
        HSerPrint ":"
        'Read byte and send
        EPRead CurrentLocation, CurrByte
        HSerPrint Hex(CurrByte)
        'Send carriage return/line feed
        HSerPrintCRLF
    Next
```

<span class="strong">**See Also**</span>
<a href="str" class="link" title="Str">Str</a>,
<a href="val" class="link" title="Val">Val</a>

</div>
