<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_fnlsl"></span>FnLSL

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    BitsOut = FnLSL(BitsIn, NumBits)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`FnLSL` (Logical Shift Left) will perform a Bitwise left shift. `FnLSL`
will return BitsIn shifted NumBits to the left, it is equivalent to the
'C' operation:

``` screen
    BitsOut = BitsIn << NumBits
```

Each left shift is the equivalent of multiplying BitsIn by 2. BitsIn and
NumBits may be may be a variable and of type: Bit, Byte, Word, Long,
Constant or another Function. Zeros are shifted in from the right, Bits
that are shifted out are lost.

It is useful for mathematical and logical operations, as well as
creating serial data streams or manipulating I/O ports.

<span class="strong">**Example:**</span>

``` screen
    ' This program will shift the LEDs on the Microchip PIC Low Pin
    ' Count Demo Board from Right to Left, that is DS1(RC0) to
    ' DS4(RC3) and repeat

    #chip    16f690        ' declare the target Device

    #define  LEDPORT PORTC ' LEDs on pins 16, 15, 14 and 7

    Dim LEDMask as Byte    ' Pattern to be displayed
    LEDMask = 0b0001       ' Initialise the Patten
    Dir LEDPORT Out        ' Enable the LED Port.

    Do
        LEDMask = FnLSL(LEDMask, 1) & 0x0F    ' Mask the lower 4 bits
        if LEDPORT.3 then LEDMask.0 = 1       ' Restart the sequence
        LEDPORT = LEDMask                     ' Display the Pattern
        wait 500 ms
    Loop
    End
```

<span class="strong">**See Also
<a href="_bitwise_operations_overview.html" class="link" title="Bitwise Operations Overview">Bitwise Operations Overview</a>**</span>
and <span
class="strong">**<a href="_conditions.html" class="link" title="Conditions">Conditions</a>**</span>

</div>
