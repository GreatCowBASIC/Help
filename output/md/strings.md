<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="strings"></span>Strings

</div>

</div>

</div>

<span class="strong">**String**</span>

Declared as:

``` programlisting
    Dim <Name> As String
```

This allocates a RAM for a string (plus one extra byte internally).
Fixed strings are not null-terminated and do not resize automatically.

<span class="strong">**Fixed-length string**</span>

Declared as:

``` programlisting
    Dim <Name> As String [* <Length>]
    Dim <Name> * <Length>
```

This allocates a 16-byte string (plus one extra byte internally). Fixed
strings are not null-terminated and do not resize automatically.

<span class="strong">**Element 0 and the "extra byte"**</span>

The "extra byte" mentioned above is element 0 of the string’s own
memory: it holds the string’s <span class="strong">**current
length**</span>, in characters. Character data itself starts at element
1, so a string declared `As String * 10` reserves 11 bytes in total — 1
length byte plus 10 usable characters. This is why
<a href="len" class="link" title="Len">Len</a> can return a
string’s length instantly, without scanning for a terminator: there is
no null terminator in GCBASIC strings at all, only this leading length
byte. Copying, reading, and comparing strings all rely on this same
convention internally.

<span class="strong">**Constraint:**</span> assigning a literal string
longer than a fixed-length string’s declared `<Length>` compiles without
warning, even though the literal’s length is already known at compile
time. For example, `Dim s As String * 4` followed by
`s = "ThisIsWayTooLong"` raises no error or warning; the assignment will
not fit in the allocated buffer at runtime. Keep fixed-length strings
comfortably larger than the longest value you plan to assign to them.

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

``` programlisting
    tmpstring = "\223C\\"
```

Produces a 3-byte string: `Chr(223)`, `C`, `\` — stored in the string
table as:

``` programlisting
    StringTable2:
    .DB  3, 223, 67, 92
```

</div>
