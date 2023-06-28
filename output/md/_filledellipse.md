<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_filledellipse"></span>FilledEllipse

</div>

</div>

</div>

<span class="strong">**FilledEllipse:**</span>

``` screen
    FilledEllipse(XPixelPosition, YPixelPosition, XRadius, YRadius [,Optional LineColour] )
```

<span class="strong">**Explanation:**</span>

Draws a FilledEllipse on a GLCD at `XPixelPosition`, `YPixelPosition`
with a specific vertex of `XRadius` and `YRadius`.

The constant `GLCD_PROTECTOVERRUN` can be added to prevent
FilledEllipses from re-drawing at the screen edges. Ensure the
`GLCD_Width` and `GLCD_HEIGHT` constants are set correctly when using
this additional constant.

<span class="strong">**Example:**</span>

``` screen
    #include <glcd.h>

    FilledEllipse(63, 31, 20, 10)
```

</div>
