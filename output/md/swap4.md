<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="swap4"></span>SWAP4

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    SWAP4( VariableA)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

Support Bytes only.

<span class="strong">**Explanation:**</span>

A function that swaps (or exchanges) nibbles (or the 8 bits of a byte in
nibbles).

<span class="strong">**Example:**</span>

``` screen
    dim ByteVariable as Byte

    ' Set variable to  0x12
    ByteVariable = 0x12

    ByteVariable = Swap4( ByteVariable )

    HSerPrint hex(ByteVariable)

    ' Would return 0x21
```

</div>
