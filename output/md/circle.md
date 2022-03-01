<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="circle"></span>Circle

</div>

</div>

</div>

<span class="strong">**Circle:**</span>

``` screen
    Circle(XPixelPosition, YPixelPosition, Radius [ [,Optional LineColour] [,Optional Rounding] ] )
```

<span class="strong">**Explanation:**</span>

Draws a circle on a GLCD at `XPixelPosition`, `YPixelPosition` with a
specific `Radius`.

The constant `GLCD_PROTECTOVERRUN` can be added to prevent circles from
re-drawing at the screen edges. Ensure the `GLCD_Width` and
`GLCD_HEIGHT` constants are set correctly when using this additional
constant.

<span class="strong">**Example:**</span>

``` screen
    #include <glcd.h>

    circle(10,10,10)  ;upper left
    circle(117,10,10) ;upper right
    circle(63,31,10)  ;center
    circle(63,31,20)  ;center
    circle(10,53,10)  ;lower left
    circle(117,53,10) ;lower right
```

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/circleb1.PNG)

</div>

</div>

</div>
