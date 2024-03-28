<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ulonginttobin"></span>ULongIntToBin

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    stringvar = ULongIntToBin(ULongIntvar)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

The `ULongIntToBin` function creates a string of a ANSI (32) characters.
The function converts a number to a string consisting of ones and zeros
that represents the binary value.

<span class="strong">**Note:**</span> Supports ULongInt variables only.
For BYTE variables use `VarToBin`, for WORD variables use `VarWToBinand`
for INTEGER variables use `VarIntegerToBin`

<span class="strong">**Example:**</span>

``` screen
    string = ULongIntToBin( 1 )   ' Returns "00000000000000000000000000000001"

    string = ULongIntToBin( 254 ) ' Returns "00000000000000000000000011111110"
```

<span class="strong">**For more help, see**</span>
<a href="" class="link">ByteToBin</a>,
<a href="" class="link">WordToBin</a>,
<a href="" class="link">IntegerToBin</a>

</div>
