<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920tile"></span>ST7920Tile

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ST7920Tile ( word variable )
```

<span class="strong">**Explanation:**</span>

This command tiles the screen with the word value provided.

<span class="strong">**Example usage:**</span>

``` screen
    Dim tileValue as word
    tileValue = (0x55 * 256 ) + 0x55
    ST7920Tile (tileValue) ‘tile the screen with a nice cross hatch
```

</div>
