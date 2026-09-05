<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920glcddisablegraphics"></span>ST7920GLCDDisableGraphics

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920GLCDDisableGraphics
```

<span class="strong">**Explanation:**</span>

This command sets the GCLD display controller to text mode.

<span class="strong">**Example usage:**</span>

``` programlisting
    ST7920GLCDDisableGraphics 'Set to text mode          ' <<< the ST7920GLCDDisableGraphics instruction
```

<span class="strong">**Key line:**</span>
`ST7920GLCDDisableGraphics` — switches the ST7920 controller back to
text mode, which uses less processing overhead than graphics mode when
only characters need to be shown.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920glcdenablegraphics" class="link" title="ST7920GLCDEnableGraphics">ST7920GLCDEnableGraphics</a> — switching
    to graphics mode
-   <a href="st7920locate" class="link" title="ST7920Locate">ST7920Locate</a> — positioning
    text after switching back to text mode

</div>

</div>
