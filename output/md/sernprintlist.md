<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="sernprintlist"></span>SerNPrintList

</div>

</div>

</div>

<span class="strong">**Ser1PrintList, Ser2PrintList,
Ser3PrintList**</span>

<span class="strong">**Syntax:**</span>

``` screen
    Ser1PrintList value1, value2 [, value3 ... ]
    Ser2PrintList value1, value2 [, value3 ... ]
    Ser3PrintList value1, value2 [, value3 ... ]
```

<span class="strong">**Command Availability:**</span>

Available anywhere the matching
<a href="sernprint" class="link" title="SerNPrint">SerNPrint</a>
command (`Ser1Print`, `Ser2Print` or `Ser3Print`) is available.

<span class="strong">**Explanation:**</span>

This command sends two or more values, in the order given, using the
channel referred to as Ser1.., Ser2.., Ser3.. according to the rules set
by the related defines — instead of writing one `SerNPrint` call per
value. Each value can be a string, integer, long, word or byte, and each
is sent using the matching typed `SerNPrint` call for that channel, so
mixing types in one statement works exactly as if each value had been
sent with its own `SerNPrint` statement.

<span class="strong">**Example:**</span>

``` programlisting
    'This program will send a heading, a label and an incrementing value
    'using PORTB.1

    ; ----- Configuration
    #chip 16F886, 16
    #option Explicit

    ; ----- Include library
    #include <SoftSerial.h>

    ; ----- Config Serial UART :
    #define SER1_BAUD 115200   ; baudrate must be defined
    ; Config I/O ports for transmitting:
    #define SER1_TXPORT PORTB  ; I/O port (without .bit) must be defined
    #define SER1_TXPIN 1       ; portbit  must be defined

    ; ----- Variables
    Dim xx As Word
    xx = 1000

    ; ----- Main body of program commences here.
    Do Forever
      Wait 1 s       'time to enjoy the result
      Ser1PrintList "Software-UART: ", xx, 13, 10   ' <<< the Ser1PrintList instruction
      xx += 1
    Loop
```

<span class="strong">**Key line:**</span>
`Ser1PrintList "Software-UART: ", xx, 13, 10` — sends the label string,
the current value of `xx`, and a CR/LF pair, all in one statement.

Exposed in SoftSerial.h authored by Frank Steinberg

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="sernprint" class="link" title="SerNPrint">SerNPrint</a> — sending
    a single value on the same channel
-   <a href="sernsend" class="link" title="SerNSend">SerNSend</a> — sending
    a single raw byte on the same channel
-   <a href="hserprintlist" class="link" title="HSerPrintList">HSerPrintList</a> — the
    same mixed-type list, on the hardware USART

</div>

</div>
