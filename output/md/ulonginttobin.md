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

``` programlisting
    string = ULongIntToBin( 1 )   ' Returns "00000000000000000000000000000001"          ' <<< the ULongIntToBin instruction

    string = ULongIntToBin( 254 ) ' Returns "00000000000000000000000011111110"
```

<span class="strong">**Key line:**</span>
`string = ULongIntToBin( 1 )` — converts the ULongInt value 1 into a
full 32-character string of ones and zeros; unlike `VarToBin`,
`VarWToBin`, and `VarIntegerToBin`, this variant always produces exactly
32 binary digits, matching the width of a ULongInt.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="bytetobin" class="link" title="ByteToBin">ByteToBin</a>
-   <a href="wordtobin" class="link" title="WordToBin">WordToBin</a>
-   <a href="integertobin" class="link" title="IntegerToBin">IntegerToBin</a>

</div>

</div>
