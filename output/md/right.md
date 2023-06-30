<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="right"></span>Right

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    output = Right(source, count)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Right` function will extract the rightmost `count` characters from
the input string `source`, and return them in a new string.

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_BLOCKING

    'Fill a string with a message
    Dim TestData As String
    TestData = "Hello, world!"

    'Display the rightmost 6 characters
    'Will display "world!"
    HSerPrint Right(TestData, 6)
    HSerPrintCRLF
```

</div>
