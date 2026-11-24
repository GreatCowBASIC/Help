<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="circle"></span>Circle

</div>

</div>

</div>

<span class="strong">**Circle:**</span>

``` programlisting
    Circle(XPixelPosition, YPixelPosition, Radius [ [,Optional LineColour] [,Optional Rounding] ] )
```

<span class="strong">**Explanation:**</span>

Draws an unfilled circle on a GLCD centred at `XPixelPosition`,
`YPixelPosition` with the given `Radius`.

The constant `GLCD_PROTECTOVERRUN` can be added to prevent circles from
re-drawing at the screen edges. Ensure the `GLCD_WIDTH` and
`GLCD_HEIGHT` constants are set correctly when using this additional
constant.

<span class="strong">**Example:**</span>

``` programlisting
    #include <glcd.h>

    circle(10,10,10)  ;upper left
    circle(117,10,10) ;upper right
    circle(63,31,10)  ;center          ' <<< the Circle instruction
    circle(63,31,20)  ;center
    circle(10,53,10)  ;lower left
    circle(117,53,10) ;lower right
```

<span class="strong">**Key line:**</span> `circle(63,31,10)` — draws a
10-pixel-radius unfilled circle centred at the middle of a 128x64
display. image::circleb1.PNG\[graphic,align="center"\]

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview
-   <a href="filledcircle" class="link" title="FilledCircle">FilledCircle</a> — the
    filled equivalent of this command
-   <a href="fonts_and_characters" class="link" title="Fonts and Characters">Fonts and Characters</a> — related
    command in the same category

</div>

</div>
