<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="integertohex"></span>IntegerToHex

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = IntegerToHex(number)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Hex` function will convert a Integer number into hexadecimal
format. The input `number` should be a Integer variable, or a fixed
number between -32767 and -32767 inclusive. After running the function,
the string variable `stringvar` will contain an 4 digit hexadecimal
number.

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING


    'Send EEPROM data over serial connection
    'Uses Hex to display as hexadecimal
    For CurrentLocation = 0 to 65535
        'Send location
        HSerPrint IntegerToHex(CurrentLocation)
        HSerPrint ":"
        'Read Integer and send
        EPRead CurrentLocation, CurrInteger
        HSerPrint Hex(CurrInteger)
        'Send carriage return/line feed
        HSerPrintCRLF
    Next
```

<span class="strong">**See Also**</span>
<a href="bytetohex" class="link" title="ByteToHex">ByteToHex</a>,<a href="" class="link">WordToHex</a>,
<a href="longtohex" class="link" title="LongToHex">LongToHex</a>,
<a href="singletohex" class="link" title="SingleToHex">SingleToHex</a>

</div>
