<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920glcdenablegraphics"></span>ST7920GLCDEnableGraphics

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920GLCDEnableGraphics
```

<span class="strong">**Explanation:**</span>

This command sets the GCLD display controller to graphics mode.

<span class="strong">**Example usage:**</span>

``` programlisting
    ST7920GLCDEnableGraphics 'Set to graphics mode          ' <<< the ST7920GLCDEnableGraphics instruction
```

<span class="strong">**Key line:**</span>
`ST7920GLCDEnableGraphics` — switches the ST7920 controller into
graphics mode, required before using pixel-level commands such as
`ST7920LineHs` or `ST7920GLCDClearGraphics`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920glcddisablegraphics" class="link" title="ST7920GLCDDisableGraphics">ST7920GLCDDisableGraphics</a> — switching
    back to text mode
-   <a href="st7920glcdcleargraphics" class="link" title="ST7920GLCDClearGraphics">ST7920GLCDClearGraphics</a> — clearing
    the display once in graphics mode

</div>

</div>
