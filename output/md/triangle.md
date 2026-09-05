<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="triangle"></span>Triangle

</div>

</div>

</div>

<span class="strong">**Triangle:**</span>

``` programlisting
    Triangle(XPixelPosition1, YPixelPosition1, XPixelPosition2, YPixelPosition2, XPixelPosition3, YPixelPosition3 [,Optional LineColour] )
```

<span class="strong">**Explanation:**</span>

Draws an unfilled triangle on a GLCD with corners at `XPixelPositionN`,
`YPixelPositionN` for N = 1, 2, 3.

The constant `GLCD_PROTECTOVERRUN` can be added to prevent triangles
from re-drawing at the screen edges. Ensure the `GLCD_WIDTH` and
`GLCD_HEIGHT` constants are set correctly when using this additional
constant.

<span class="strong">**Example:**</span>

``` programlisting
    #include <glcd.h>

    Triangle(0, 0, 31, 63, 127, 0 )          ' <<< the Triangle instruction
```

<span class="strong">**Key line:**</span>
`Triangle(0, 0, 31, 63, 127, 0 )` — draws an unfilled triangle spanning
the top-left corner, a point partway down the left side, and the
top-right corner of a 128x64 display.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="filledtriangle" class="link" title="FilledTriangle">FilledTriangle</a> — the
    filled equivalent of this command
-   <a href="box" class="link" title="Box">Box</a> — related
    command in the same category

</div>

</div>
