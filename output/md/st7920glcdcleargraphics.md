<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920glcdcleargraphics"></span>ST7920GLCDClearGraphics

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920GLCDClearGraphics
```

<span class="strong">**Explanation:**</span>

This command clears the GCLD display.

<span class="strong">**Example usage:**</span>

``` programlisting
    ST7920GLCDClearGraphics 'clear the screen          ' <<< the ST7920GLCDClearGraphics instruction
```

<span class="strong">**Key line:**</span>
`ST7920GLCDClearGraphics` — clears every pixel on the display; call
`ST7920GLCDEnableGraphics` first if the controller is currently in text
mode.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920glcdenablegraphics" class="link" title="ST7920GLCDEnableGraphics">ST7920GLCDEnableGraphics</a> — switching
    to graphics mode before clearing it
-   <a href="st7920glcddisablegraphics" class="link" title="ST7920GLCDDisableGraphics">ST7920GLCDDisableGraphics</a> — returning
    to text mode

</div>

</div>
