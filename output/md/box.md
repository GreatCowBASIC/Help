<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="box"></span>Box

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    Box(LineX1,LineY1, LineX2, LineY2 [, LineColour ] )
```

<span class="strong">**Explanation:**</span>

Draws a box (unfilled rectangle) on a graphic LCD from the upper corner
at pixel position `LineX1`, `LineY1` to pixel position `LineX2`,
`LineY2`.

`LineColour` can be specified. Typically the value is 0 or 1,
corresponding to `GLCDBackground` and `GLCDForeground` respectively.

<span class="strong">**Example:**</span>

``` programlisting
    #include <glcd.h>

    Box(10, 10, 100, 50)          ' <<< the Box instruction
```

<span class="strong">**Key line:**</span> `Box(10, 10, 100, 50)` — draws
an unfilled rectangle from pixel (10,10) to pixel (100,50) using the
current foreground colour.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="filledbox" class="link" title="FilledBox">FilledBox</a> — the
    filled equivalent of this command

</div>

</div>
