<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="swap4"></span>SWAP4

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    SWAP4( VariableA)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

Support Bytes only.

<span class="strong">**Explanation:**</span>

A function that swaps (or exchanges) nibbles (or the 8 bits of a byte in
nibbles).

<span class="strong">**Example:**</span>

``` programlisting
    dim ByteVariable as Byte

    ' Set variable to  0x12
    ByteVariable = 0x12

    ByteVariable = Swap4( ByteVariable )          ' <<< the SWAP4 instruction

    HSerPrint hex(ByteVariable)

    ' Would return 0x21
```

<span class="strong">**Key line:**</span>
`ByteVariable = Swap4( ByteVariable )` — swaps the high and low nibbles
of the byte, turning `0x12` into `0x21`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="swap" class="link" title="SWAP">SWAP</a> — related
    command in the same category
-   <a href="using_variables" class="link" title="Using Variables">Using Variables</a> — related
    command in the same category

</div>

</div>
