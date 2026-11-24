<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="swap"></span>SWAP

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    SWAP( VariableA, VariableB)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

Support Bytes and Words only.

<span class="strong">**Explanation:**</span>

A function that swaps (or exchanges) one byte or word for another. SWAP
supports the use of byte and word variables.

<span class="strong">**Example:**</span>

``` programlisting
    dim ByteA as Byte
    dim ByteB as Byte

    ByteA = 10
    ByteB = 20

    SWAP( ByteA, ByteB )          ' <<< the SWAP instruction

    HSerPrint ByteA
    HSerPrintCRLF
    HSerPrint ByteB
    HSerPrintCRLF
```

<span class="strong">**Key line:**</span>
`SWAP( ByteA, ByteB )` — exchanges the values held in `ByteA` and
`ByteB`, so after this line `ByteA` holds 20 and `ByteB` holds 10.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="swap4" class="link" title="SWAP4">SWAP4</a> — related
    command in the same category
-   <a href="using_variables" class="link" title="Using Variables">Using Variables</a> — related
    command in the same category

</div>

</div>
