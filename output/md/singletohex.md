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

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Hex` function will convert a Single number into hexadecimal format.
The input `number` should be a Single variable, or a fixed number
between -3.4x10 ^ 38 and +3.4x10 ^ 38 inclusive. After running the
function, the string variable `stringvar` will contain an 4 digit
hexadecimal number.

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING


    'Send EEPROM data over serial connection
    'Uses Hex to display as hexadecimal
    For CurrentLocation = 0 to 9999999
        'Send location
        HSerPrint SingleToHex(CurrentLocation)
        HSerPrint ":"
        'Read Single and send
        EPRead CurrentLocation, CurrSingle
        HSerPrint Hex(CurrSingle)
        'Send carriage return/line feed
        HSerPrintCRLF
    Next
```

<span class="strong">**See Also**</span>
<a href="bytetohex" class="link" title="ByteToHex">ByteToHex</a>,<a href="" class="link">WordToHex</a>,
<a href="longtohex" class="link" title="LongToHex">LongToHex</a>,
<a href="integertohex" class="link" title="IntegerToHex">IntegerToHex</a>

</div>
