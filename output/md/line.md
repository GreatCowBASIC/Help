<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="line"></span>Line

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Line(LineX1,LineY1, LineX2, LineY2, Optional LineColour = 1)
```

<span class="strong">**Explanation:**</span>

Draws a line on a GLCD from pixel X1, Y1 location to pixel X2,Y2
location.

<span class="strong">**Example:**</span>

``` screen
    #include <glcd.h>

    line 0,0,127,63
    line 0,63,127,0
    line 40,0,87,63
    line 40,63,87,0
```

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/lineb1.PNG)

</div>

</div>

</div>
