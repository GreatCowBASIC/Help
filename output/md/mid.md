<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="mid"></span>Mid

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    output = Mid(source, start[, count])
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Mid` function returns a string variable containing a specified
number of characters from a source string.

`source` is the variable to extract from. If `source` is a zero-length
string, a zero-length string is returned, equating to `""`.  
`start` is the position of the first character to extract. If `start` is
greater than the number of characters in the string, `Mid` returns a
zero-length string equating to `""`.  
`count` is the number of characters to extract. If `count` is not
specified, all characters from `start` to the end of the source string
are returned.

<span class="strong">**Example:**</span>

``` programlisting
    'Set chip model
    #chip 16F1936

    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING


    'Fill a string with a message
    Dim TestData As String
    TestData = "The cat sat on the mat"

    'Extract "cat". The c is at position 5, and 3 letters are needed
    HSerPrint "The animal is a "
    HSerPrint Mid(TestData, 5, 3)          ' <<< the Mid instruction, with a count

    'Extract the action. "sat" starts at position 9.
    HSerPrint "The animal "
    HSerPrint Mid(TestData, 9)          ' <<< the Mid instruction, without a count
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span> `Mid(TestData, 5, 3)` — starts
at character 5 of `TestData` and takes exactly 3 characters, returning
`"cat"`; the second call omits `count` and returns everything from
position 9 onward instead.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="left" class="link" title="Left">Left</a> — extracting
    from the start of a string
-   <a href="right" class="link" title="Right">Right</a> — extracting
    from the end of a string

</div>

</div>
