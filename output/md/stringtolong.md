<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="stringtolong"></span>StringToLong

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    var = StringToLong(string)   'Supports decimal Long range strings only.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `StringToLong` function extracts a number from a string variable and
stores it in a Long variable. One potential use is reading numbers that
are sent in ASCII format over a serial connection.  
  
`StringToLong` will not extract a value from a hexadecimal string.  
  

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
    dim longvar as long

    longvar = 0

    ; ----- Main body of program commences here.

     #option Explicit

     do
         wait 100 ms

         Longvar = StringToLong( "255" )          ' <<< the StringToLong instruction
         HSerPrint Longvar
         HSerPrintCRLF

         wait 1 s
      loop
    end
```

<span class="strong">**Key line:**</span>
`Longvar = StringToLong( "255" )` — parses the decimal digits in the
literal string `"255"` and stores the resulting long value in `Longvar`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="stringtobyte" class="link" title="StringToByte">StringToByte</a> — related
    command in the same category
-   <a href="stringtosingle" class="link" title="StringToSingle">StringToSingle</a> — related
    command in the same category
-   <a href="longtostring" class="link" title="LongToString">LongToString</a> — the
    inverse conversion

</div>

</div>
