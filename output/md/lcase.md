<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="lcase"></span>LCase

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    output = LCase(source)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `LCase` function converts all of the letters in the string `source`
to lower case, and returns the result. Characters that are not letters
are left unchanged.

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

    'Display the string in lower case
    'Will display "hello, world!"
    HSerPrint LCase(TestData)          ' <<< the LCase instruction
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span> `LCase(TestData)` — returns
`TestData` with every letter converted to lower case, leaving the comma
and exclamation mark untouched.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="ucase" class="link" title="UCase">UCase</a> — the
    inverse conversion, to upper case

</div>

</div>
