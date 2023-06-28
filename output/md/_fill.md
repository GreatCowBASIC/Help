<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_fill"></span>Fill

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar =  Fill ( byte_value_of_the_new_length , pad_character )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The Fill function is used to create string to a specific length that is
of a specific character.

The length of the string is specified by the first parameter. The
character used to pad the string is specified by the second parameter,
this parameter is optional as the " "(space) character is assumed.

A typical use is to fill a string to be displayed on an LCD or serial
terminal.

<span class="strong">**Example:**</span>

``` screen
    'Set chip model
    #chip 16F886


    'Set up hardware serial connection
    #define USART_BAUD_RATE 9600
   #define USART_TX_BLOCKING



    HserPrint Fill ( 16, "" ) ;will print a string of '*'
    HSerPrintCRLF
```

<span class="strong">**For more help, see**</span>
<a href="_asc.html" class="link" title="Asc">Asc</a>

</div>
