<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920writedata"></span>ST7920WriteData

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920WriteData ( byte_variable)
```

<span class="strong">**Explanation:**</span>

This command writes data to the controller.

See the data sheet for more information.

<span class="strong">**Example usage:**</span>

``` programlisting
    ...
    for yy = 0 to ( GLCD_HEIGHT - 1 )
      ST7920gLocate(0, yy)
      for xx = 0 to ( GLCD_COLS -1 )
        ST7920WriteData( 0x55 )          ' <<< the ST7920WriteData instruction
        ST7920WriteData( 0x55 )
      next
    next
    ...
```

<span class="strong">**Key line:**</span>
`ST7920WriteData( 0x55 )` — writes the raw byte 0x55 to the display’s
DDRAM at the position set by `ST7920gLocate`; called twice per column
here to fill both bytes needed at that pixel location.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920writecommand" class="link" title="ST7920WriteCommand">ST7920WriteCommand</a> — sending
    a controller command instead of display data
-   <a href="st7920glocate" class="link" title="ST7920gLocate">ST7920gLocate</a> — positioning
    the write address before writing, as used above

</div>

</div>
