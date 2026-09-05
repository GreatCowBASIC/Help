<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920linev"></span>ST7920linev

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920linev ( Xpos, Ypos, yUnitsStyle, )
```

<span class="strong">**Explanation:**</span>

This command draws a vertical line with the specific style. The style
can be ON or OFF. Default is ON

This is called by the GLCD common routines.

<span class="strong">**Example usage:**</span>

``` programlisting
    ST7920linev ( 0, 0, 64 , ON) 'will draw a line          ' <<< the ST7920linev instruction
```

<span class="strong">**Key line:**</span>
`ST7920linev ( 0, 0, 64 , ON)` — draws a solid vertical line 64 pixels
long starting at (0, 0); passing `OFF` instead of `ON` erases a line at
that position rather than drawing one.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920lineh" class="link" title="ST7920lineh">ST7920lineh</a> — the
    horizontal-line equivalent
-   <a href="st7920linehs" class="link" title="ST7920LineHs">ST7920LineHs</a> — drawing
    a horizontal line with a custom dash/dot style byte

</div>

</div>
