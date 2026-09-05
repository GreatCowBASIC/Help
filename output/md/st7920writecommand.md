<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920writecommand"></span>ST7920WriteCommand

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920WriteCommand ( byte_variable)
```

<span class="strong">**Explanation:**</span>

This command writes a command to the controller.

See the data sheet for more information.

<span class="strong">**Example usage:**</span>

``` programlisting
    ...
    ST7920WriteCommand(0x36) ' set the graphics mode on          ' <<< the ST7920WriteCommand instruction
    GLCD_TYPE_ST7920_GRAPHICS_MODE = true
    ...
```

<span class="strong">**Key line:**</span>
`ST7920WriteCommand(0x36)` — sends the raw command byte 0x36 to the
ST7920 controller to enable graphics mode; the following line updates
the library’s own `GLCD_TYPE_ST7920_GRAPHICS_MODE` flag to keep
GCBASIC’s internal state consistent with the controller.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920writedata" class="link" title="ST7920WriteData">ST7920WriteData</a> — sending
    display data instead of a controller command
-   <a href="st7920glcdenablegraphics" class="link" title="ST7920GLCDEnableGraphics">ST7920GLCDEnableGraphics</a> — the
    higher-level command that wraps this behaviour

</div>

</div>
