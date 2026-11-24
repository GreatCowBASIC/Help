<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="shift"></span>Shift

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Shift variable [,] { Left | Right }
```

<span class="strong">**Command Availability:**</span>

Available on PIC and AVR microcontrollers.

<span class="strong">**Explanation:**</span>

The `Shift` command performs a logical shift of `variable` by one bit in
the direction given. `variable` can be a Byte, Word or Long and is
changed in place.

<div class="itemizedlist">

-   A `0` is always shifted into the vacated bit: the least significant
    bit on `Left`, the most significant bit on `Right`.
-   The bit shifted out is discarded. Unlike
    <a href="rotate" class="link" title="Rotate">Rotate</a>,
    `Shift` does not feed the carry bit (`STATUS.C`) back into the
    variable, and the carry flag should not be relied on after the
    command.
-   A `Left` shift multiplies an unsigned value by 2, and a `Right`
    shift divides it by 2.
-   For a Word or Long the shift runs through every byte, so the bit
    shifted out of one byte is shifted into the next.
-   `Left` and `Right` can be written `L` and `R`. The comma, and
    brackets round the variable, are optional: `Shift Value Left`,
    `Shift Value, Left` and `Shift (Value) Left` are the same.

</div>

`Shift` moves one bit each time it is used. To shift by several places,
repeat it:

``` programlisting
    Repeat 4
        Shift Value, Left
    End Repeat
```

`Shift` is faster than
<a href="fnlsl" class="link" title="FnLSL">FnLSL</a> and
<a href="fnlsr" class="link" title="FnLSR">FnLSR</a> for a shift
of one place or a few places, because it is compiled in line and does
not call a function. Use `FnLSL` or `FnLSR` when the number of places is
held in a variable and the shifted value is needed inside an expression.

<span class="strong">**Example:**</span>

``` programlisting
    ' Shift a byte and a word, left then right.
    ' Look at the values in the simulator, or send them to a terminal.

    #chip 16F18855, 32

    Dim TestByte As Byte
    Dim TestWord As Word

    TestByte = 0b10010010
    Shift TestByte, Left        ' <<< the Shift instruction: 0b00100100, the top bit is lost
    Shift TestByte, Right       ' 0b00010010, a 0 enters at the top

    TestWord = 0x0080
    Shift TestWord, Left        ' 0x0100: the bit moves from the low byte to the high byte
    Shift TestWord, Right       ' 0x0080

    End
```

<span class="strong">**Key line:**</span> `Shift TestWord, Left` — moves
every bit of the Word one place left through both bytes, a `0` entering
at the bottom, with no carry fed back.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="rotate" class="link" title="Rotate">Rotate</a> — rotates
    a variable through the carry bit instead of shifting in a 0
-   <a href="fnlsl" class="link" title="FnLSL">FnLSL</a> — a left
    shift by any number of places, as a function
-   <a href="fnlsr" class="link" title="FnLSR">FnLSR</a> — a right
    shift by any number of places, as a function
-   <a href="bitwise_operations_overview" class="link" title="Bitwise Operations Overview">Bitwise Operations Overview</a> — background
    on GCBASIC’s bitwise operations

</div>

</div>
