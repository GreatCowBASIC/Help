<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ellipse"></span>Ellipse

</div>

</div>

</div>

<span class="strong">**Ellipse:**</span>

``` programlisting
    Ellipse(XPixelPosition, YPixelPosition, XRadius, YRadius [,Optional LineColour] )
```

<span class="strong">**Explanation:**</span>

Draws an unfilled ellipse on a GLCD centred at `XPixelPosition`,
`YPixelPosition` with the given `XRadius` and `YRadius`.

The constant `GLCD_PROTECTOVERRUN` can be added to prevent ellipses from
re-drawing at the screen edges. Ensure the `GLCD_WIDTH` and
`GLCD_HEIGHT` constants are set correctly when using this additional
constant.

<span class="strong">**Example:**</span>

``` programlisting
    #include <glcd.h>

    Ellipse(63, 31, 20, 10)          ' <<< the Ellipse instruction
```

<span class="strong">**Key line:**</span>
`Ellipse(63, 31, 20, 10)` — draws an ellipse centred at the middle of a
128x64 display, 40 pixels wide and 20 pixels tall (`XRadius`/`YRadius`
are each half the full width/height).

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="filledellipse" class="link" title="FilledEllipse">FilledEllipse</a> — the
    filled equivalent of this command
-   <a href="circle" class="link" title="Circle">Circle</a> — the
    equal-radius special case of an ellipse

</div>

</div>
