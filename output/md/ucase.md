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

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `UCase` function converts all of the letters in the string `source`
to upper case, and returns the result. Characters that are not letters
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

    'Display the string in upper case
    'Will display "HELLO, WORLD!"
    HSerPrint UCase(TestData)          ' <<< the UCase instruction
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span> `UCase(TestData)` — returns
`TestData` with every letter converted to upper case, leaving the comma
and exclamation mark untouched.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcase" class="link" title="LCase">LCase</a> — the
    inverse conversion, to lower case

</div>

</div>
