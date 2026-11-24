<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="asc"></span>Asc

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    bytevar= ASC(string, [position] )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

Returns the character code of the character at the specified position in
a string.

`ASC` returns the character code of a particular character in the
string. If the string is an ANSI string, the returned value is in the
range 0 to 255. This function does NOT support Unicode.

The optional `position` parameter determines which character is checked.
The first character is 1, the second is 2, and so on. If `position` is
omitted, the first character is used.

`CHR` is the natural complement of `ASC` — it produces a one-character
string corresponding to a given ASCII code.

<span class="strong">**Note:**</span>

If the string passed is null (zero-length), or `position` is zero or
greater than the length of the string, the returned value is 0.

<span class="strong">**Example:**</span>

``` programlisting
    charpos = ASC( "ABCD" )     ' Returns 65          ' <<< the ASC instruction, default position

    charpos = ASC( "ABCD", 2 )  ' Returns 66
```

<span class="strong">**Key line:**</span> `ASC( "ABCD" )` — reads the
first character by default (position omitted), returning `65`, the ASCII
code for `'A'`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="chr" class="link" title="Chr">Chr</a> — the inverse
    operation, converting a code back to a character

</div>

</div>
