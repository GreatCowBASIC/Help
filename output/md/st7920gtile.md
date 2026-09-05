<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920gtile"></span>ST7920gTile

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920gTile ( byte variable , byte variable)
```

<span class="strong">**Explanation:**</span>

Tile LCD screen with two bytes in Graphic Mode.

<span class="strong">**Example usage:**</span>

``` programlisting
    ST7920gTile (0x55, 0x85) 'tile the screen with an odd cross hatch          ' <<< the ST7920gTile instruction
```

<span class="strong">**Key line:**</span>
`ST7920gTile (0x55, 0x85)` — fills the screen in graphics mode using two
alternating byte patterns (0x55 and 0x85), one for even columns and one
for odd, producing an irregular cross-hatch.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920tile" class="link" title="ST7920Tile">ST7920Tile</a> — the
    text-mode, single-word tiling equivalent
-   <a href="st7920ctile" class="link" title="ST7920cTile">ST7920cTile</a> — tiling
    with a Chinese character instead

</div>

</div>
