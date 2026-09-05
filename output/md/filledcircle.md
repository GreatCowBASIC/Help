<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="filledcircle"></span>FilledCircle

</div>

</div>

</div>

<span class="strong">**Circle:**</span>

``` programlisting
    FilledCircle(XPixelPosition, YPixelPosition, Radius [,Optional LineColour] )
```

<span class="strong">**Explanation:**</span>

Draws a filled circle on a GLCD centred at `XPixelPosition`,
`YPixelPosition` with the given `Radius`.

<span class="strong">**Example:**</span>

``` programlisting
    #include <glcd.h>

    filledcircle(10,10,10)  ;upper left
    filledcircle(117,10,10) ;upper right
    filledcircle(63,31,10)  ;center          ' <<< the FilledCircle instruction
    filledcircle(63,31,20)  ;center
    filledcircle(10,53,10)  ;lower left
    filledcircle(117,53,10) ;lower right
```

<span class="strong">**Key line:**</span>
`filledcircle(63,31,10)` — draws a solid 10-pixel-radius circle centred
at the middle of a 128x64 display.
image::filledcircleb1.PNG\[graphic,align="center"\]

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="circle" class="link" title="Circle">Circle</a> — the
    unfilled equivalent of this command
-   <a href="filledbox" class="link" title="FilledBox">FilledBox</a> — related
    command in the same category
-   <a href="filledellipse" class="link" title="FilledEllipse">FilledEllipse</a> — related
    command in the same category

</div>

</div>
