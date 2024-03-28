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
microcontrollers

<span class="strong">**Explanation:**</span>

The `WordToBin` function creates a string of a ANSI (8-byte) characters.
The function converts a number to a string consisting of ones and zeros
that represents the binary value.

<span class="strong">**Example:**</span>

``` screen
    string = WordToBin(1)       ' Returns "0000000000000001"

    string = WordToBin(37654)   ' Returns "1001001100010110"
```

<span class="strong">**For more help, see**</span>
<a href="bytetobin" class="link" title="ByteToBin">ByteToBin</a>

</div>
