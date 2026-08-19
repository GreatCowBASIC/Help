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

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `ByteToBin` function creates a string of a ANSI (8-byte) characters.
The function converts a number to a string consisting of ones and zeros
that represents the binary value.

<span class="strong">**Note:**</span> Supports BYTE variables only. For
WORD variables use `WordToBin`

<span class="strong">**Example:**</span>

``` screen
    string = ByteToBin( 1 )   ' Returns "00000001"

    string = ByteToBin( 254 ) ' Returns "11111110"
```

<span class="strong">**For more help, see**</span>
<a href="wordtobin" class="link" title="WordToBin">WordToBin</a>

</div>
