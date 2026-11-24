<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="longtobin"></span>LongToBin

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = LongToBin(longvar)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `LongToBin` function creates a string of ANSI characters
representing a Long’s binary value. It converts a number into a
32-character string consisting of ones and zeros.

<span class="strong">**Note:**</span> Supports `Long` variables only.
For `Byte` variables use `ByteToBin`, for `Word` variables use
`WordToBin`, and for `Integer` variables use `IntegerToBin`.

<span class="strong">**Example:**</span>

``` programlisting
    string = LongToBin( 1 )   ' Returns "00000000000000000000000000000001"          ' <<< the LongToBin instruction

    string = LongToBin( 254 ) ' Returns "00000000000000000000000011111110"
```

<span class="strong">**Key line:**</span> `LongToBin( 1 )` — returns a
fixed 32-character binary string, since a `Long` occupies 4 bytes (32
bits) of storage.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bytetobin" class="link" title="ByteToBin">ByteToBin</a>
-   <a href="wordtobin" class="link" title="WordToBin">WordToBin</a>
-   <a href="integertobin" class="link" title="IntegerToBin">IntegerToBin</a>

</div>

</div>
