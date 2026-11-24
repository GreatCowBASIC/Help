<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920ctile"></span>ST7920cTile

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
  ST7920cTile ( word variable )
```

<span class="strong">**Explanation:**</span>

Tiles screen with a Chinese Symbol.

This required 2 bytes of data into DDRAM to display one 16x16 font from
memory location A140H\~D75FH are BIG5 code, A1A0H\~F7FFH are GB code.

<span class="strong">**Example usage:**</span>

``` programlisting
    Dim CTileValue as word
    cTileValue = (0xA140 * 256 ) + 0xA140
    ST7920cTile (CTileValue) 'tile the screen with a BIG5 character          ' <<< the ST7920cTile instruction
```

<span class="strong">**Key line:**</span>
`ST7920cTile (CTileValue)` — repeats the 16-bit BIG5 character code
0xA140 across the entire screen; `CTileValue` must fall in the BIG5
range (0xA140-0xD75F) or the GB range (0xA1A0-0xF7FF) to select a valid
Chinese character.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920tile" class="link" title="ST7920Tile">ST7920Tile</a> — tiling
    with a raw 16-bit pattern instead of a character
-   <a href="st7920gtile" class="link" title="ST7920gTile">ST7920gTile</a> — the
    graphic-mode two-byte tiling equivalent

</div>

</div>
