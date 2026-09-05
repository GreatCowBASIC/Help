<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920tile"></span>ST7920Tile

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920Tile ( word variable )
```

<span class="strong">**Explanation:**</span>

This command tiles the screen with the word value provided.

<span class="strong">**Example usage:**</span>

``` programlisting
    Dim tileValue as word
    tileValue = (0x55 * 256 ) + 0x55
    ST7920Tile (tileValue) 'tile the screen with a nice cross hatch          ' <<< the ST7920Tile instruction
```

<span class="strong">**Key line:**</span>
`ST7920Tile (tileValue)` — repeats the 16-bit pattern `tileValue` (here
0x5555) across the entire screen; since the high and low bytes are
identical alternating-bit patterns, the result is a cross-hatch fill.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920ctile" class="link" title="ST7920cTile">ST7920cTile</a> — tiling
    with a Chinese character instead of a raw pattern
-   <a href="st7920gtile" class="link" title="ST7920gTile">ST7920gTile</a> — the
    graphic-mode two-byte tiling equivalent

</div>

</div>
