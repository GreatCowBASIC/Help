<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="wordtohex"></span>WordToHex

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = WordToHex(number)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Hex` function will convert a Word number into hexadecimal format.
The input `number` should be a Word variable, or a fixed number between
0 and 65525 inclusive. After running the function, the string variable
`stringvar` will contain a 4 digit hexadecimal number.

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
        HSerPrint WordToHex(CurrentLocation)
        HSerPrint ":"
        'Read Word and send
        EPRead CurrentLocation, CurrWord
        HSerPrint Hex(CurrWord)
        'Send carriage return/line feed
        HSerPrintCRLF
    Next
```

<span class="strong">**See Also**</span>
<a href="bytetohex" class="link" title="ByteToHex">ByteToHex</a>,<a href="" class="link">LongToHex</a>,
<a href="integertohex" class="link" title="IntegerToHex">IntegerToHex</a>,
<a href="singletohex" class="link" title="SingleToHex">SingleToHex</a>

</div>
