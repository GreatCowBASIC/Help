<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="stringtoword"></span>StringToWord

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    var = StringToWord(string)   'Supports decimal Word range strings only.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `StringToWord` function extracts a number from a string variable and
stores it in a Word variable. One potential use is reading numbers that
are sent in ASCII format over a serial connection.  
  
`StringToWord` will not extract a value from a hexadecimal string.  
  

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
    dim wordvar as Word

    wordvar = 0

    ; ----- Main body of program commences here.

     #option Explicit

     do
         wait 100 ms

         Wordvar = StringToWord( "65535" )          ' <<< the StringToWord instruction
         HSerPrint WordVar
         HSerPrintCRLF

         wait 1 s
      loop
    end
```

<span class="strong">**Key line:**</span>
`Wordvar = StringToWord( "65535" )` — parses the decimal digits in the
literal string `"65535"` and stores the resulting word value in
`Wordvar`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="stringtobyte" class="link" title="StringToByte">StringToByte</a> — related
    command in the same category
-   <a href="stringtolong" class="link" title="StringToLong">StringToLong</a> — related
    command in the same category
-   <a href="wordtostring" class="link" title="WordToString">WordToString</a> — the
    inverse conversion

</div>

</div>
