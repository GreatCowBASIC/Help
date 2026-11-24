<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="bytetobin"></span>ByteToBin

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = ByteToBin(bytevar)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

The `ByteToBin` function creates a string of ANSI characters
representing a byte’s binary value. It converts a number into an
8-character string consisting of ones and zeros.

<span class="strong">**Note:**</span> Supports `Byte` variables only.
For `Word` variables, use `WordToBin`.

<span class="strong">**Example:**</span>

``` programlisting
    string = ByteToBin( 1 )   ' Returns "00000001"          ' <<< the ByteToBin instruction

    string = ByteToBin( 254 ) ' Returns "11111110"
```

<span class="strong">**Key line:**</span> `ByteToBin( 1 )` — returns the
8-character string `"00000001"`, the binary representation of the byte
value 1, padded with leading zeros to a fixed width.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="wordtobin" class="link" title="WordToBin">WordToBin</a> — the
    equivalent conversion for Word variables
-   <a href="bytetohex" class="link" title="ByteToHex">ByteToHex</a> — converting
    a byte to hexadecimal instead of binary

</div>

</div>
