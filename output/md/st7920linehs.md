<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="st7920linehs"></span>ST7920LineHs

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    ST7920LineHs ( Xpos, Ypos, XLength, Style)
```

<span class="strong">**Explanation:**</span>

This command draws a line with a specific style. The style is based on
the bits value of the byte passed to the routine.

<span class="strong">**Example usage:**</span>

``` programlisting
    ST7920LineHs ( 0, 31,128 , 0x55) 'will draw a dashed line          ' <<< the ST7920LineHs instruction
```

<span class="strong">**Key line:**</span>
`ST7920LineHs ( 0, 31,128 , 0x55)` — draws a 128-pixel-long horizontal
line starting at (0, 31); the style byte `0x55` (binary 01010101)
alternates one pixel on, one pixel off, producing a dashed line.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="st7920lineh" class="link" title="ST7920lineh">ST7920LineH</a> — a
    solid horizontal line, without a style byte
-   <a href="st7920linev" class="link" title="ST7920linev">ST7920LineV</a> — the
    vertical-line equivalent

</div>

</div>
