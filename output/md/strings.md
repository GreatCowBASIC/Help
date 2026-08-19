<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="strings"></span>Strings

</div>

</div>

</div>

<span class="strong">**String**</span>

Declared as:

``` screen
    Dim <Name> As String
```

This allocates a RAM for a string (plus one extra byte internally).
Fixed strings are not null-terminated and do not resize automatically.

<span class="strong">**Fixed-length string**</span>

Declared as:

``` screen
    Dim <Name> As String [* <Length>]
    Dim <Name> * <Length>
```

This allocates a 16-byte string (plus one extra byte internally). Fixed
strings are not null-terminated and do not resize automatically.

<span class="strong">**String Escape Sequences**</span>

String literals in GCBASIC source support escape sequences, allowing
arbitrary byte values to be embedded directly in strings without
workarounds. This capability removes the need to use CHR() which is
expensive in terms of RAM. From build 1603.

<span class="strong">**Supported Sequences**</span>

<div class="informaltable">

| Sequence | Value                                 | Example           |
|:---------|:--------------------------------------|:------------------|
| `\xNN`   | Hex byte, exactly 2 digits (0-9, A-F) | `\xDC` → Chr(220) |
| `\0xNN`  | Hex byte, exactly 2 digits (0-9, A-F) | `\0x1F` → Chr(31) |
| `\NNN`   | Decimal byte, exactly 3 digits (0-9)  | `\223` → Chr(223) |
| `\r`     | Carriage return                       | Chr(13)           |
| `\n`     | Newline                               | Chr(10)           |
| `\t`     | Tab                                   | Chr(9)            |
| `\\`     | Literal backslash                     | Chr(92)           |
| `\"`     | Literal double-quote                  | Chr(34)           |

</div>

<span class="strong">**Rules**</span>

<div class="itemizedlist">

-   Hex digits must be uppercase or lowercase A-F; exactly 2 are
    required.
-   Decimal values must be exactly 3 digits and in the range 000-255.
-   An unrecognised escape sequence produces a compile-time error with
    file and line number.

</div>

<span class="strong">**Example**</span>

``` screen
    tmpstring = "\223C\\"
```

Produces a 3-byte string: `Chr(223)`, `C`, `\` — stored in the string
table as:

``` screen
    StringTable2:
    .DB  3, 223, 67, 92
```

</div>
