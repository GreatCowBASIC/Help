<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920writecommand"></span>ST7920WriteCommand

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    ST7920GWriteCommand ( byte_variable)
```

<span class="strong">**Explanation:**</span>

This command writes a command to the controller.

See the data sheet for more information.

<span class="strong">**Example usage:**</span>

``` screen
    ...
    ST7920WriteCommand(0x36) ' set the graphics mode on
    GLCD_TYPE_ST7920_GRAPHICS_MODE = true
    ...
```

</div>
