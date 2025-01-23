<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="filledtriangle"></span>FilledTriangle

</div>

</div>

</div>

<span class="strong">**FilledTriangle:**</span>

``` screen
    FilledTriangle( XPixelPosition1, YPixelPosition1, XPixelPosition2, YPixelPosition2, XPixelPosition3, YPixelPosition3 [,Optional LineColour] )
```

<span class="strong">**Explanation:**</span>

Draws a FilledTriangle on a GLCD at `XPixelPositionN`,
`YPixelPositionN`.

The constant `GLCD_PROTECTOVERRUN` can be added to prevent
FilledTriangles from re-drawing at the screen edges. Ensure the
`GLCD_Width` and `GLCD_HEIGHT` constants are set correctly when using
this additional constant.

<span class="strong">**Example:**</span>

``` screen
    #include <glcd.h>

    FilledTriangle(0, 0, 31, 63, 127, 0 )
```

</div>
