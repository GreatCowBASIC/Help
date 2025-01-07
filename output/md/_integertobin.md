<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_integertobin"></span>IntegerToBin

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = IntegerToBin(integervar)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `IntegerToBin` function creates a string of a ANSI (signed 15 digit
string ) characters. The function converts a number to a string
consisting of ones and zeros that represents the binary value.

<span class="strong">**Note:**</span> Supports Integer variables only.
For BYTE variables use `VarToBin`, for Word variables use `WordToBin`
and for LONG variables use `LongToBin`

<span class="strong">**Example:**</span>

``` screen
    string = IntegerToBin( 1 )   ' Returns "+000000000000001"
    string = IntegerToBin( -1 )  ' Returns "-000000000000001"
```

<span class="strong">**For more help, see**</span>
<a href="_bytetobin.html" class="link" title="ByteToBin">ByteToBin</a>,
<a href="_wordtobin.html" class="link" title="WordToBin">WordToBin</a>,
<a href="_longtobin.html" class="link" title="LongToBin">LongToBin</a>

</div>
