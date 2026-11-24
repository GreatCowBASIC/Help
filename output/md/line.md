<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="line"></span>Line

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    Line(LineX1,LineY1, LineX2, LineY2, Optional LineColour = 1)
```

<span class="strong">**Explanation:**</span>

Draws a line on a GLCD from pixel `LineX1`, `LineY1` to pixel `LineX2`,
`LineY2`.

`LineColour` can be specified. Typically the value is 0 or 1,
corresponding to `GLCDBackground` and `GLCDForeground` respectively; it
defaults to 1 (foreground) if omitted.

<span class="strong">**Example:**</span>

``` programlisting
    #include <glcd.h>

    line 0,0,127,63          ' <<< the Line instruction
    line 0,63,127,0
    line 40,0,87,63
    line 40,63,87,0
```

<span class="strong">**Key line:**</span> `line 0,0,127,63` — draws a
diagonal line from the top-left corner to the bottom-right corner of a
128x64 display. image::lineb1.PNG\[graphic,align="center"\]

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="pset" class="link" title="Pset">PSet</a> — setting a
    single pixel rather than a line
-   <a href="box" class="link" title="Box">Box</a> — drawing a
    rectangle from two corner points

</div>

</div>
