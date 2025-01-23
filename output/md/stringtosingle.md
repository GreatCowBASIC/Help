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

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `StringToSingle` function will extract a number from a string
variable, and store it in a Single variable.  One potential use is
formatting a serial number recieve via a serial connection.  
  
The `StringToSingle` function will not extract a StringToSingle from a
hexadecimal string.  
  

The function supports two messages to support usage.

``` literallayout
'   SysByte_STS_Err = 0 if no error
'   SysByte_STS_Err.0 = 1 good - 0 - bad
'   SysByte_STS_Err.1 = 1 decimals places to many chars,  0 = ok
'   SysByte_STS_Err.2 = 1 integer places to many chars-out of range,   0 = ok
'   SysByte_STS_Err.3 = 1 no decimal point, info only
'   SysByte_STS_Err.4 = non numeric chars found
```

<span class="strong">**Example Usage 1:**</span>

``` screen
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
    dim bytevar as Byte
    dim wordvar as Word
    dim Singlevar as Single

    bytevar = 0
    wordvar = 0
    Singlevar = 0



    ; ----- Main body of program commences here.

     #option Explicit

     do
         wait 100 ms

         Singlevar = StringToSingle( "255" )
         HSerPrint SingltoString(Singlevar)
         HSerPrintCRLF

         wait 1 s
      loop
    end

  ; ----- Support methods.  Subroutines and Functions
```

</div>
