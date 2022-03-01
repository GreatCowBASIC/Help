<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920writedata"></span>ST7920WriteData

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ST7920GWriteData ( byte_variable)
```

<span class="strong">**Explanation:**</span>

This command writes data to the controller.

See the data sheet for more information.

<span class="strong">**Example usage:**</span>

``` screen
    ...
    for yy = 0 to ( GLCD_HEIGHT - 1 )
      ST7920gLocate(0, yy)
      for xx = 0 to ( GLCD_COLS -1 )
        ST7920WriteData( 0x55 )
        T7920WriteData( 0x55 )
      next
    next
    ...
```

</div>
