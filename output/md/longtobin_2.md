<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="longtobin_2"></span>LongToBin

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = SingleToBin(Singlevar)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `SingleToBin` function creates a string of a ANSI (32) characters.
The function converts a number to a string consisting of ones and zeros
that represents the binary value.

<span class="strong">**Note:**</span> Supports Single variables only.
For BYTE variables use `VarToBin`, for WORD variables use `VarWToBinand`
for INTEGER variables use `VarIntegerToBin`

<span class="strong">**Example:**</span>

``` screen
    string = SingleToBin( 1 )   ' Returns "00000000000000000000000000000001"

    string = SingleToBin( 254 ) ' Returns "00000000000000000000000011111110"
```

<span class="strong">**For more help, see**</span>
<a href="" class="link">ByteToBin</a>,
<a href="" class="link">WordToBin</a>,
<a href="" class="link">IntegerToBin</a>

</div>
