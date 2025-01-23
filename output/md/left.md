<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="left"></span>Left

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    output = Left(source, count)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Left` function will extract the leftmost `count` characters from
the input string `source`, and return them in a new string.

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

    'Display the leftmost 5 characters
    'Will display "Hello"
    HSerPrint Left(TestData, 5)
    HSerPrintCRLF
```

<span class="strong">**See Also**</span>
<a href="mid" class="link" title="Mid">Mid</a>,
<a href="right" class="link" title="Right">Right</a>

</div>
