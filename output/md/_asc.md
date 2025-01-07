<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_asc"></span>Asc

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    bytevar= ASC(string, [position] )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers

<span class="strong">**Explanation:**</span>

Returns the character code of the character at the specified position in
a string.

`ASC` returns the character code of a particular character in the
string. If the string is an ANSI string, the returned value will be in
the range of 0 to 255. This function DOES NOT support UNICODE.

The optional position parameter determines which character is to be
checked. The first character is one, the second two, etc. If the
position parameter is missing, the first character is presumed.

`CHR` is the natural complement of `ASC`. `CHR` produces a one-character
string corresponding to its ASCII.

<span class="strong">**Note:**</span>

If the string passed is null (zero-length) or the position is zero or
greater than the length of the string the returned value will be 0.

<span class="strong">**Example:**</span>

``` screen
    charpos = ASC( "ABCD" )     ' Returns 65

    charpos = ASC( "ABCD", 2 )  ' Returns 66
```

<span class="strong">**For more help, see**</span>
<a href="_chr.html" class="link" title="Chr">Chr</a>

</div>
