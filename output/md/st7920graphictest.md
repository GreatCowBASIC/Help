<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920graphictest"></span>ST7920GraphicTest

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920GraphicTest
```

<span class="strong">**Explanation:**</span>

This command tests the graphics functionality of the GLCD display.

<span class="strong">**Example usage:**</span>

``` programlisting
    ST7920GraphicTest 'Test the display          ' <<< the ST7920GraphicTest instruction
```

<span class="strong">**Key line:**</span> `ST7920GraphicTest` — runs a
built-in self-test pattern on the display, useful for confirming the
wiring and controller are working before writing your own graphics code.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920glcdenablegraphics" class="link" title="ST7920GLCDEnableGraphics">ST7920GLCDEnableGraphics</a> — switching
    to graphics mode
-   <a href="st7920glcdcleargraphics" class="link" title="ST7920GLCDClearGraphics">ST7920GLCDClearGraphics</a> — clearing
    the test pattern afterward

</div>

</div>
