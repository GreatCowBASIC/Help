<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="filledbox"></span>FilledBox

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    FilledBox(LineX1,LineY1, LineX2, LineY2, Optional LineColour = 1)
```

<span class="strong">**Explanation:**</span>

Draws a filled box on a graphic LCD from the upper corner of pixel
`LineX1`, `LineY1` to pixel `LineX2`, `LineY2`.  

`LineColour` can be specified. Typically the value is 0 or 1,
corresponding to `GLCDBackground` and `GLCDForeground` respectively; it
defaults to 1 (foreground) if omitted.

<span class="strong">**Example:**</span>

``` programlisting
    #include <glcd.h>

    FilledBox(10, 10, 100, 50)          ' <<< the FilledBox instruction
```

<span class="strong">**Key line:**</span>
`FilledBox(10, 10, 100, 50)` — draws a solid rectangle from pixel
(10,10) to pixel (100,50), filled with the current foreground colour.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="box" class="link" title="Box">Box</a> — the unfilled
    equivalent of this command

</div>

</div>
