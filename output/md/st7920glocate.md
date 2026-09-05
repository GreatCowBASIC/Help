<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920glocate"></span>ST7920gLocate

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920gLocate ( Xpos, Ypos)
```

<span class="strong">**Explanation:**</span>

This command locates the pixel at the specific X and Y location of the
graphical screen.

<span class="strong">**Example usage:**</span>

``` programlisting
    ST7920gLocate ( 64, 31) 'the pixel at the mid screen point          ' <<< the ST7920gLocate instruction
```

<span class="strong">**Key line:**</span>
`ST7920gLocate ( 64, 31)` — positions the pixel cursor at the middle of
a 128x64 display; unlike `ST7920Locate`, which addresses text-mode rows
and columns, this command addresses raw pixel coordinates in graphics
mode.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920locate" class="link" title="ST7920Locate">ST7920Locate</a> — the
    text-mode equivalent of this command
-   <a href="st7920glcdenablegraphics" class="link" title="ST7920GLCDEnableGraphics">ST7920GLCDEnableGraphics</a> — switching
    to graphics mode before using this command

</div>

</div>
