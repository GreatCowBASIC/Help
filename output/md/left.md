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

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Left` function extracts the leftmost `count` characters from the
input string `source`, and returns them in a new string.

<span class="strong">**Example:**</span>

``` programlisting
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
    HSerPrint Left(TestData, 5)          ' <<< the Left instruction
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span> `Left(TestData, 5)` — returns
the first 5 characters of `TestData`, giving `"Hello"`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="right" class="link" title="Right">Right</a> — extracting
    characters from the end of a string instead
-   <a href="mid" class="link" title="Mid">Mid</a> — extracting
    characters from an arbitrary position

</div>

</div>
