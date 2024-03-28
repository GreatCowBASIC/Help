<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ellipse"></span>Ellipse

</div>

</div>

</div>

<span class="strong">**Ellipse:**</span>

``` screen
    Ellipse(XPixelPosition, YPixelPosition, XRadius, YRadius [,Optional LineColour] )
```

<span class="strong">**Explanation:**</span>

Draws a Ellipse on a GLCD at `XPixelPosition`, `YPixelPosition` with a
specific vertex of `XRadius` and `YRadius`.

The constant `GLCD_PROTECTOVERRUN` can be added to prevent Ellipses from
re-drawing at the screen edges. Ensure the `GLCD_Width` and
`GLCD_HEIGHT` constants are set correctly when using this additional
constant.

<span class="strong">**Example:**</span>

``` screen
    #include <glcd.h>

    Ellipse(63, 31, 20, 10)
```

</div>
