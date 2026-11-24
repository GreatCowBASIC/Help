<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="sernsend"></span>SerNSend

</div>

</div>

</div>

<span class="strong">**Ser1Send, Ser2Send, Ser3Send**</span>

<span class="strong">**Syntax:**</span>

``` screen
    Ser1Send data
    Ser2Send data
    Ser3Send data
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command will send a byte given by data using the channel referred
to as Ser1.. , Ser2…​ , Ser3…​ according to the rules set by the related
defines.

<span class="strong">**Example:**</span>

``` programlisting
    'This program will send one byte using PORTA.5

    ; ----- Configuration
    #chip 12F1501, 1

    ; ----- Include library
    #include <SoftSerial.h>

    ; ----- Config Serial UART for sending:
    #define SER1_BAUD 9600     ; baudrate must be defined
    #define SER1_TXPORT PORTA  ; I/O port (without .bit) must be defined
    #define SER1_TXPIN 5       ; portbit  must be defined

    ; ----- Main body of program commences here.
    Ser1Send 88   'send one byte (88 = X)          ' <<< the Ser1Send instruction
```

<span class="strong">**Key line:**</span> `Ser1Send 88` — transmits the
single byte 88 (ASCII `X`) on the software-UART channel configured by
the `SER1_BAUD`/`SER1_TXPORT`/`SER1_TXPIN` defines above; unlike
`SerSend`, no separate `InitSer` call is needed since `SoftSerial.h`
configures the channel entirely from \`\#define\`s.

Exposed in SoftSerial.h authored by Frank Steinberg

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="sernprint" class="link" title="SerNPrint">SerNPrint</a> — sending
    a string or numeric value on the same channel
-   <a href="sernreceive" class="link" title="SerNReceive">SerNReceive</a> — the
    counterpart function for reading a byte back

</div>

</div>
