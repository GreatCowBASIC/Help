<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_fnlsr"></span>FnLSR

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    BitsOut = FnLSR(BitsIn, NumBits)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`FnLSR` (Logical Shift Right) will perform a Bitwise right shift.
`FnLSR` will return BitsIn shifted NumBits to the right, it is
equivalent to the 'C' operation:

``` screen
    BitsOut = BitsIn >> NumBits
```

Each right shift is the equivalent of dividing BitsIn by 2.

BitsIn and NumBits may be may be a variable and of type: Bit, Byte,
Word, Long, Constant or another Function.

Zeros are shifted in from the left, Bits that are shifted out are lost.

It is useful for mathematical and logical operations, as well as
creating serial data streams or manipulating I/O ports.

<span class="strong">**Example:**</span>

``` screen
    ' This program will shift the LEDs on the Microchip PIC Low Pin Count Demo Board
    ' from Right to Left, that is DS4(RC3) to DS1(RC0) and repeat.

    #chip    16f690        ' declare the target Device

    #define  LEDPORT PORTC ' LEDs on pins 16, 15, 14 and 7

    Dim LEDMask as Byte    ' Pattern to be displayed
    LEDMask = 0b1000       ' Initialise the Patten
    Dir LEDPORT Out        ' Enable the LED Port.

    Do
      LEDPORT = LEDMask    ' Display the Pattern
      wait 500 ms
      LEDMask = FnLSR(LEDMask, 1) & 0x0F ' Mask the lower 4 bits
      if LEDPORT.0 then LEDMask.3 = 1    ' Restart the sequence
    Loop
    End
```

<span class="strong">**See Also
<a href="_bitwise_operations_overview.html" class="link" title="Bitwise Operations Overview">Bitwise Operations Overview</a>**</span>
and <span
class="strong">**<a href="_conditions.html" class="link" title="Conditions">Conditions</a>**</span>

</div>
