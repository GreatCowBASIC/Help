<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="integertobin"></span>IntegerToBin

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = IntegerToBin(integervar)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `IntegerToBin` function creates a signed, 16-character string
representing an Integer’s binary value: a leading `+` or `-` sign
followed by 15 binary digits.

<span class="strong">**Note:**</span> Supports `Integer` variables only.
For `Byte` variables use `ByteToBin`, for `Word` variables use
`WordToBin`, and for `Long` variables use `LongToBin`.

<span class="strong">**Example:**</span>

``` programlisting
    string = IntegerToBin( 1 )   ' Returns "+000000000000001"          ' <<< the IntegerToBin instruction
    string = IntegerToBin( -1 )  ' Returns "-000000000000001"
```

<span class="strong">**Key line:**</span> `IntegerToBin( -1 )` — returns
a string that keeps the sign character separate from the 15 magnitude
digits, so the sign is always in the same position regardless of the
value.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bytetobin" class="link" title="ByteToBin">ByteToBin</a>
-   <a href="wordtobin" class="link" title="WordToBin">WordToBin</a>
-   <a href="longtobin" class="link" title="LongToBin">LongToBin</a>

</div>

</div>
