<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="instr"></span>Instr

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    location = Instr(source, find)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `Instr` function searches one string to find the location of another
string within it. `source` is the string to search inside, and `find` is
the string to find. The function returns the location of `find` within
`source`, or 0 if `source` does not contain `find`.

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

    'Display the location of "world" within the string
    'Will return 8, because "w" in world is the 8th character
    'of "Hello, world!"
    HSerPrint Instr(TestData, "world")          ' <<< the Instr instruction, a match found
    HSerPrintCRLF

    'Display the location of "planet" within the string
    'Will display 0, because "planet" does not occur inside
    'the string "Hello, world!"
    HSerPrint Instr(TestData, "planet")          ' <<< the Instr instruction, no match found
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span>
`Instr(TestData, "world")` — returns `8`, the 1-based position where
`"world"` begins inside `TestData`; the second call shows the not-found
case, which returns `0` rather than an error.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="mid" class="link" title="Mid">Mid</a> — extracting
    the substring once its position is known
-   <a href="asc" class="link" title="Asc">Asc</a> — related
    command in the same category

</div>

</div>
