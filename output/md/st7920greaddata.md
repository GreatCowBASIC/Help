<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920greaddata"></span>ST7920gReaddata

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    byte_variable = ST7920gReaddata
```

<span class="strong">**Explanation:**</span>

This function return the word value (16 bits) of the GLCD display for
the current XY position.

See the data sheet for more information.

<span class="strong">**Example usage:**</span>

``` screen
    ...
    ' Read a word from the display device.
    word_variable = ST7920GLCDReadData
```

</div>
