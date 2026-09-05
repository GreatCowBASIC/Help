<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="fnlsl"></span>FnLSL

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

`FnLSL` (Logical Shift Left) performs a bitwise left shift. It returns
`BitsIn` shifted left by `NumBits` places, equivalent to the C
operation:

``` programlisting
    BitsOut = BitsIn << NumBits
```

Each left shift is equivalent to multiplying `BitsIn` by 2. `BitsIn` and
`NumBits` can each be a variable, constant, or another function’s
result, of type Bit, Byte, Word, or Long. Zeros are shifted in from the
right; bits shifted out of the left end are discarded and lost — there
is no overflow flag or carry-out from this function, so do not rely on
`FnLSL` to detect that a value has grown too large for its variable
type.

It is useful for mathematical and logical operations, as well as for
creating serial data streams or manipulating I/O ports one bit-pattern
at a time.

<span class="strong">**Example:**</span>

``` programlisting
    ' This program will shift the LEDs on the Microchip PIC Low Pin
    ' Count Demo Board from Right to Left, that is DS1(RC0) to
    ' DS4(RC3) and repeat

    #chip    16f690        ' declare the target Device

    #define  LEDPORT PORTC ' LEDs on pins 16, 15, 14 and 7

    Dim LEDMask as Byte    ' Pattern to be displayed
    LEDMask = 0b0001       ' Initialise the Patten
    Dir LEDPORT Out        ' Enable the LED Port.

    Do
        LEDMask = FnLSL(LEDMask, 1) & 0x0F    ' <<< the FnLSL instruction
        if LEDPORT.3 then LEDMask.0 = 1       ' Restart the sequence
        LEDPORT = LEDMask                     ' Display the Pattern
        wait 500 ms
    Loop
    End
```

<span class="strong">**Key line:**</span>
`FnLSL(LEDMask, 1) & 0x0F` — shifts the lit LED one position left, then
masks the result down to 4 bits so the pattern wraps within \`LEDPORT’s
lower nibble instead of drifting into unrelated bits.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bitwise_operations_overview" class="link" title="Bitwise Operations Overview">Bitwise Operations Overview</a> — background
    on GCBASIC’s bitwise operations
-   <a href="fnlsr" class="link" title="FnLSR">FnLSR</a> — the
    equivalent right-shift function
-   <a href="conditions" class="link" title="Conditions">Conditions</a> — the
    `if` test used to restart the sequence in the example above

</div>

</div>
