<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920lineh"></span>ST7920lineh

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920lineh ( Xpos, Ypos, xUnitsStyle, )
```

<span class="strong">**Explanation:**</span>

This command draws a horizontal line with the specific style. The style
can be ON or OFF. Default is ON.

This is called by the GLCD common routines.

<span class="strong">**Example usage:**</span>

``` programlisting
    ST7920lineh ( 0, 31,128 , ON) 'will draw a line          ' <<< the ST7920lineh instruction
```

<span class="strong">**Key line:**</span>
`ST7920lineh ( 0, 31,128 , ON)` — draws a solid 128-pixel-long
horizontal line starting at (0, 31); passing `OFF` instead of `ON`
erases a line at that position rather than drawing one.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920linev" class="link" title="ST7920linev">ST7920linev</a> — the
    vertical-line equivalent
-   <a href="st7920linehs" class="link" title="ST7920LineHs">ST7920LineHs</a> — drawing
    a horizontal line with a custom dash/dot style byte

</div>

</div>
