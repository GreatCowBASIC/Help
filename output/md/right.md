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

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Right` function extracts the rightmost `count` characters from the
input string `source`, and returns them in a new string.

<span class="strong">**Example:**</span>

``` programlisting
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
    HSerPrint Right(TestData, 6)          ' <<< the Right instruction
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span> `Right(TestData, 6)` — returns
the last 6 characters of `TestData`, giving `"world!"`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="left" class="link" title="Left">Left</a> — extracting
    characters from the start of a string instead
-   <a href="mid" class="link" title="Mid">Mid</a> — extracting
    characters from an arbitrary position

</div>

</div>
