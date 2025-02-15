<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="sernreceive"></span>SerNReceive

</div>

</div>

</div>

<span class="strong">**Ser1Receive, Ser2Receive, Ser3Receive**</span>

<span class="strong">**Syntax:**</span>

``` screen
    bytevar = Ser1Receive
    bytevar = Ser2Receive
    bytevar = Ser3Receive
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

This function will read a byte using the channel referred to as Ser1.. ,
Ser2…​ , Ser3…​ according to the rules set by the related defines. The
received byte is stored in the variable bytevar. By default the function
waits for the startbit impulse edge before executing the following
commands. See the sample files how to realize timeout-functionality or
interrupt-driven receiving.

<span class="strong">**Example:**</span>

``` screen
    'This program will receive bytes on PORTB.0 and send back using PORTB.1

    ; ----- Configuration
    #chip 16F886, 16
    #option Explicit

    ; ----- Include library
    #include <SoftSerial.h>

    ; ----- Config Serial UART :
    #define SER1_BAUD 115200   ; baudrate must be defined
    #define SER1_DATABITS 7    ; databits optional (default = 8)
    #define SER1_STOPBITS 2    ; stopbits optional (default = 1)
    #define SER1_INVERT Off    ; inverted polarity optional (default = Off)
    ; Config I/O ports for transmitting:
    #define SER1_TXPORT PORTB  ; I/O port (without .bit) must be defined
    #define SER1_TXPIN 1       ; portbit  must be defined
    ; Config I/O ports for receiving:
    #define SER1_RXPORT PORTB  ; I/O port (without .bit) must be defined
    #define SER1_RXPIN 0       ; portbit  must be defined
    #define SER1_RXNOWAIT Off  ; don't wait for stopbit optional (default = Off)

    ; ----- Variables
    Dim RecByte As Byte

    ; ----- Main body of program commences here.
     Wait 1 Ms     'delay to prevent garbage if sending too quick after init
     Ser1Send 10   'new line in Terminal
     Ser1Send 13   '
     Ser1Print "Please send a byte!"

     Do Forever
      RecByte = Ser1Receive   'receive one byte - wait until detecting startbit
      Ser1Send  13            'new line in Terminal
      Ser1Send  10            '
      Ser1Print "You sent: "  'send a text
      Ser1Send RecByte        'send the sign representing the byte
     Loop
```

Exposed in SoftSerial.h authored by Frank Steinberg

</div>
