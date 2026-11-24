<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="stringtobyte"></span>StringToByte

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    var = StringToByte(string)   'Supports decimal byte range strings only.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `StringToByte` function extracts a number from a string variable and
stores it in a byte variable. One potential use is reading numbers that
are sent in ASCII format over a serial connection.  
  
`StringToByte` will not extract a value from a hexadecimal string.  
  

<span class="strong">**Example 1:**</span>

``` programlisting
    ' ----- Configuration
    'Chip Settings.
    #chip 16f18855,32
    #Config MCLRE_ON

    ; ----- Define Hardware settings

    'Set the PPS of the RS232 ports.
    UNLOCKPPS
      RC0PPS = 0x0010     'RC0->EUSART:TX;
      RXPPS  = 0x0011     'RC1->EUSART:RX;
    LOCKPPS

    ; ----- Constants
    #define USART_BAUD_RATE 19200
    #define USART_TX_BLOCKING

    ; ----- Variables
    dim bytevar as Byte

    bytevar = 0

    ; ----- Main body of program commences here.

     #option Explicit

     do
         wait 100 ms

         bytevar = StringToByte( "255" )          ' <<< the StringToByte instruction
         HSerPrint bytevar
         HSerPrintCRLF

         wait 1 s
      loop
    end
```

<span class="strong">**Key line:**</span>
`bytevar = StringToByte( "255" )` — parses the decimal digits in the
literal string `"255"` and stores the resulting byte value in `bytevar`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="stringtolong" class="link" title="StringToLong">StringToLong</a> — related
    command in the same category
-   <a href="stringtosingle" class="link" title="StringToSingle">StringToSingle</a> — related
    command in the same category
-   <a href="bytetostring" class="link" title="ByteToString">ByteToString</a> — the
    inverse conversion

</div>

</div>
