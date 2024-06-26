<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="sernprint"></span>SerNPrint

</div>

</div>

</div>

<span class="strong">**Ser1Print, Ser2Print, Ser3Print**</span>

<span class="strong">**Syntax:**</span>

``` screen
    Ser1Print value
    Ser2Print value
    Ser3Print value
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This command will send a value using the channel referred to as Ser1.. ,
Ser2…​ , Ser3…​ according to the rules set by the related defines. value
can be a string, integer, long, word or byte.

<span class="strong">**Example:**</span>

``` screen
    'This program will send text and an icrementing value using PORTB.1

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
      Ser1Send  13   'new line in Terminal
      Ser1Send  10
      Ser1Print "Software-UART: "  'send a text
      Ser1Print xx   'send the value of xx
      xx += 1
    Loop
```

Exposed in SoftSerial.h authored by Frank Steinberg

</div>
