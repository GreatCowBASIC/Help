<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920ctile"></span>ST7920cTile

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  ST7920cTile ( word variable )
```

<span class="strong">**Explanation:**</span>

Tiles screen with a Chinese Symbol.

This required 2 bytes of data into DDRAM to display one 16x16 font from
memory location A140H\~D75FH are BIG5 code, A1A0H\~F7FFH are GB code.

<span class="strong">**Example usage:**</span>

``` screen
    Dim CTileValue as word
    cTileValue = (0xA140H * 256 ) + 0xA140H
    ST7920Tile (CTileValue) ‘tile the screen with a nice cross hatch
```

</div>
