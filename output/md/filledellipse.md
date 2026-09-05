<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="filledellipse"></span>FilledEllipse

</div>

</div>

</div>

<span class="strong">**FilledEllipse:**</span>

``` programlisting
    FilledEllipse(XPixelPosition, YPixelPosition, XRadius, YRadius [,Optional LineColour] )
```

<span class="strong">**Explanation:**</span>

Draws a filled ellipse on a GLCD centred at `XPixelPosition`,
`YPixelPosition` with the given `XRadius` and `YRadius`.

The constant `GLCD_PROTECTOVERRUN` can be added to prevent filled
ellipses from re-drawing at the screen edges. Ensure the `GLCD_WIDTH`
and `GLCD_HEIGHT` constants are set correctly when using this additional
constant.

<span class="strong">**Example:**</span>

``` programlisting
    #include <glcd.h>

    FilledEllipse(63, 31, 20, 10)          ' <<< the FilledEllipse instruction
```

<span class="strong">**Key line:**</span>
`FilledEllipse(63, 31, 20, 10)` — draws a solid ellipse centred at the
middle of a 128x64 display, 40 pixels wide and 20 pixels tall.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="ellipse" class="link" title="Ellipse">Ellipse</a> — the
    unfilled equivalent of this command
-   <a href="filledbox" class="link" title="FilledBox">FilledBox</a> — related
    command in the same category
-   <a href="filledcircle" class="link" title="FilledCircle">FilledCircle</a> — related
    command in the same category

</div>

</div>
