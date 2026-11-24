<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920greaddata"></span>ST7920gReaddata

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    word_variable = ST7920gReaddata
```

<span class="strong">**Explanation:**</span>

This function returns the word value (16 bits) of the GLCD display for
the current XY position.

See the data sheet for more information.

<span class="strong">**Example usage:**</span>

``` programlisting
    ...
    ' Read a word from the display device.
    word_variable = ST7920gReaddata          ' <<< the ST7920gReaddata instruction
```

<span class="strong">**Key line:**</span>
`word_variable = ST7920gReaddata` — reads a full 16-bit word from the
display’s DDRAM at the current XY position in a single call, rather than
the two separate byte reads and manual combination that
`ST7920GLCDReadByte` requires.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920glcdreadbyte" class="link" title="ST7920GLCDReadByte">ST7920GLCDReadByte</a> — the
    byte-at-a-time equivalent of this command
-   <a href="st7920glocate" class="link" title="ST7920gLocate">ST7920gLocate</a> — positioning
    the read address before reading

</div>

</div>
