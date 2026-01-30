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

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `Instr` function will search one string to find the location of
another string within it. `source` is the string to search inside, and
`find` is the string to find. The function will return the location of
`find` within `source`, or 0 if `source` does not contain `find`.

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

    'Display the location of "world" within the string
    'Will return 8, because "w" in world is the 8th character
    'of "Hello, world!"
    HSerPrint Instr(TestData, "world")
    HSerPrintCRLF

    'Display the location of "planet" within the string
    'Will display 0, because "planet" does not occur inside
    'the string "Hello, world!"
    HSerPrint Instr(TestData, "planet")
    HSerPrintCRLF
```

</div>
