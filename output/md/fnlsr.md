<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="fnlsr"></span>FnLSR

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

`FnLSR` (Logical Shift Right) performs a bitwise right shift. It returns
`BitsIn` shifted right by `NumBits` places, equivalent to the C
operation:

``` programlisting
    BitsOut = BitsIn >> NumBits
```

Each right shift is equivalent to dividing `BitsIn` by 2 (discarding any
remainder). `BitsIn` and `NumBits` can each be a variable, constant, or
another function’s result, of type Bit, Byte, Word, or Long. Zeros are
shifted in from the left; bits shifted out of the right end are
discarded and lost — there is no rounding, so shifting an odd number
right always truncates rather than rounds.

It is useful for mathematical and logical operations, as well as for
creating serial data streams or manipulating I/O ports one bit-pattern
at a time.

<span class="strong">**Example:**</span>

``` programlisting
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
      LEDMask = FnLSR(LEDMask, 1) & 0x0F ' <<< the FnLSR instruction
      if LEDPORT.0 then LEDMask.3 = 1    ' Restart the sequence
    Loop
    End
```

<span class="strong">**Key line:**</span>
`FnLSR(LEDMask, 1) & 0x0F` — shifts the lit LED one position right, then
masks the result down to 4 bits so the pattern wraps within \`LEDPORT’s
lower nibble instead of drifting into unrelated bits.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bitwise_operations_overview" class="link" title="Bitwise Operations Overview">Bitwise Operations Overview</a> — background
    on GCBASIC’s bitwise operations
-   <a href="fnlsl" class="link" title="FnLSL">FnLSL</a> — the
    equivalent left-shift function
-   <a href="conditions" class="link" title="Conditions">Conditions</a> — the
    `if` test used to restart the sequence in the example above

</div>

</div>
