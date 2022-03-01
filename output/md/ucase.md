<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ucase"></span>UCase

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  output = UCase(source)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `UCase` function will convert all of the letters in the string
`source` to upper case, and return the result.

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

    'Display the string in upper case
    'Will display "HELLO, WORLD!"
    HSerPrint UCase(TestData)
    HSerPrintCRLF
```

<span class="strong">**See Also**</span>
<a href="lcase" class="link" title="LCase">LCase</a>

</div>
