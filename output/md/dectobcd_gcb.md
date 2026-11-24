<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="dectobcd_gcb"></span>DecToBcd\_GCB

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
 DectoBcd( ByteVariable )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

Converts numbers from decimal to Binary Coded Decimal (BCD) format.
Supports bytes only. In BCD, each nibble (4 bits) of a byte represents
one decimal digit — for example, the decimal number 23 becomes the BCD
byte `0x23`.

This is not a built-in GCBASIC command; it is a user-defined function
you add to your own program and call when needed.

<span class="strong">**Example:**</span>

``` programlisting
    Function DecToBcd(va) as Byte
       DecToBcd=(va/10)*16+va%10          ' <<< the DecToBcd instruction
    End Function
```

<span class="strong">**Key line:**</span>
`DecToBcd=(va/10)*16+va%10` — splits the decimal value `va` into tens
and units, then packs the tens digit into the high nibble and the units
digit into the low nibble of the result byte.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bcdtodec_gcb" class="link" title="BcdToDec_GCB">BcdToDec_GCB</a> — the
    inverse conversion

</div>

</div>
