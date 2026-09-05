<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="bcdtodec_gcb"></span>BcdToDec\_GCB

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    BcdToDec_GCB ( ByteVariable )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

Supports bytes only.

<span class="strong">**Explanation:**</span>

Converts numbers from Binary Coded Decimal (BCD) format to decimal. In
BCD, each nibble (4 bits) of a byte represents one decimal digit — for
example, the BCD byte `0x23` represents the decimal number 23, not 35.

This is not a built-in GCBASIC command; it is a user-defined function
you add to your own program and call when needed.

<span class="strong">**Example:**</span>

``` programlisting
    Function BcdToDec(va) as byte
        BcdToDec=(va/16)*10+va%16          ' <<< the BcdToDec instruction
    End Function
```

<span class="strong">**Key line:**</span>
`BcdToDec=(va/16)*10+va%16` — treats the high nibble of `va` (`va/16`)
as the tens digit and the low nibble (`va%16`) as the units digit,
combining them into an ordinary decimal value.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="dectobcd_gcb" class="link" title="DecToBcd_GCB">DecToBcd_GCB</a> — the
    inverse conversion

</div>

</div>
