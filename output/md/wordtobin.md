<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="wordtobin"></span>WordToBin

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  stringvar = WordToBin(bytevar)
```

<span class="strong">**Command Availability:**</span> Available on all
microcontrollers.

<span class="strong">**Explanation:**</span>

The `WordToBin` function creates a string of ANSI characters
representing a word’s binary value. It converts a number into a
16-character string consisting of ones and zeros.

<span class="strong">**Example:**</span>

``` screen
    string = WordToBin(1)       ' Returns "0000000000000001"          ' <<< the WordToBin instruction

    string = WordToBin(37654)   ' Returns "1001001100010110"
```

<span class="strong">**Key line:**</span> `WordToBin(1)` — returns the
16-character string `"0000000000000001"`, the binary representation of
the word value 1, padded with leading zeros to a fixed width.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bytetobin" class="link" title="ByteToBin">ByteToBin</a> — the
    equivalent conversion for Byte variables
-   <a href="wordtohex" class="link" title="WordToHex">WordToHex</a> — converting
    a word to hexadecimal instead of binary

</div>

</div>
