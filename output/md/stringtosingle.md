<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="stringtosingle"></span>StringToSingle

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    var = StringToSingle(string)   'Supports decimal Single range strings only.
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `StringToSingle` function extracts a number from a string variable
and stores it in a Single variable. One potential use is parsing a
floating-point value received over a serial connection.  
  
`StringToSingle` will not extract a value from a hexadecimal string.  
  

The function reports its result via a status variable:

``` programlisting
    '   SysByte_STS_Err = 0 if no error
    '   SysByte_STS_Err.0 = 1 good - 0 - bad
    '   SysByte_STS_Err.1 = 1 too many decimal-place characters, 0 = ok
    '   SysByte_STS_Err.2 = 1 too many integer-place characters (out of range), 0 = ok
    '   SysByte_STS_Err.3 = 1 no decimal point, info only
    '   SysByte_STS_Err.4 = non-numeric characters found
```

<span class="strong">**Example 1:**</span>

``` programlisting
    ' ----- Configuration
    'Chip Settings.
    #chip 16f18855,32
    #Config MCLRE_ON

    'Set the PPS of the RS232 ports.
    UNLOCKPPS
      RC0PPS = 0x0010     'RC0->EUSART:TX;
      RXPPS  = 0x0011     'RC1->EUSART:RX;
    LOCKPPS

    ; ----- Constants
    #define USART_BAUD_RATE 19200
    #define USART_TX_BLOCKING

    ; ----- Variables
    dim Singlevar as Single

    Singlevar = 0

    ; ----- Main body of program commences here.

     #option Explicit

     do
         wait 100 ms

         Singlevar = StringToSingle( "255" )          ' <<< the StringToSingle instruction
         HSerPrint SingleToString(Singlevar)
         HSerPrintCRLF

         wait 1 s
      loop
    end
```

<span class="strong">**Key line:**</span>
`Singlevar = StringToSingle( "255" )` — parses the decimal digits in the
literal string `"255"` and stores the resulting floating-point value in
`Singlevar`; the following line converts it back to a string with
`SingleToString` so `HSerPrint` can display it.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="stringtobyte" class="link" title="StringToByte">StringToByte</a> — related
    command in the same category
-   <a href="stringtolong" class="link" title="StringToLong">StringToLong</a> — related
    command in the same category
-   <a href="singletostring" class="link" title="SingleToString">SingleToString</a> — the
    inverse conversion, used above to display the result

</div>

</div>
