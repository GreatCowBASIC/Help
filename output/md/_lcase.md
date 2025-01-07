<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_lcase"></span>LCase

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    output = LCase(source)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `LCase` function will convert all of the letters in the string
`source` to lower case, and return the result.

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING


    'Fill a string with a message
    Dim TestData As String
    TestData = "Hello, world!"

    'Display the string in lower case
    'Will display "hello, world!"
    HSerPrint LCase(TestData)
    HSerPrintCRLF
```

<span class="strong">**See Also**</span>
<a href="_ucase.html" class="link" title="UCase">UCase</a>

</div>
