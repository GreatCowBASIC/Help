<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="parabola"></span>Parabola

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Parabola (x,  y,  p_factor,  type, modestop, optional LineColour=GLCDForeground)
```

<span class="strong">**Explanation:**</span>

Draws on a GLCD a parabola with equation y^2=2\*p\_factor\*x, centered
at pixel positions (x, y) .

The parabola is an unbounded curve.

The parabola can be alined either along the x axis or along the y axis.

Drawing parabola on the screen can be constrained by following two
different criteria: - a branch has reached a border of the display. -
both branches have reached the display border.

For a parabola centered on the display these criteria are equivalent.

<span class="strong">**Input parameters:**</span>

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Parameter</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">x, y</code></p></td>
<td style="text-align: left;"><p>X, Y coordinates of the parabola vertex. X is the minimum x value of the parabola when alined along X. Y is the minimum y value of the parabola when alined along y   in pixel positions</p>
<p>The x or y coordinates are Word value, p_factor is word value, type and ModeStop are byte values .</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">p_factor</code></p></td>
<td style="text-align: left;"><p>The factor such that y^2=2*p_factor*x is the equation of the parabola</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">type</code></p></td>
<td style="text-align: left;"><p>type=1 the parabola is aligned along x axis<br />
type=2 the parabola is aligned along y axis</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">modestop</code></p></td>
<td style="text-align: left;"><p>modestop=1 drawing stops when a display border is encountered by a parabola branch.<br />
modestop=2 drawing stops when all the parabolla branches encountered a border</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LineColour</code></p></td>
<td style="text-align: left;"><p>Color of the parabola</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Example:**</span>

``` screen
    'Example for a 240x320 pixels GLCD

    #include <glcd.h>

    Parabola(120, 160, 20, 1, 2, GLCDForeground)   ;  centered, p_factor=20, x_axis alined, stops when all branches have reached a a border
    Parabola(120, 160 ,20, 1, 1, GLCDForeground)   ; centered, p_factor=20, x_axis alined, stops when a border is reached
    Parabola(120, 160, 20, 2, 1, GLCDForeground)   ; centered, p_factor=20, y_axis alined, stops when a border is reached,

    Parabola(180, 80, 20, 1, 1, GLCDForeground)   ; upper right, p_factor=20, x_axis alined, stops when a border is touched,
    Parabola(60, 240, 20, 1, 2, GLCDForeground)   ; lower left, p_factor=20, x_axis alined, stops when all branches have reached a border

    Parabola(180, 80, 20, 2, 1, GLCDForeground)   ; upper right, p_factor=20, y_axis alined, stops when a border is touched,
    Parabola(60, 240, 20, 2, 2, GLCDForeground)   ; lower left, p_factor=20, y_axis alined, stops when all branches have reached a border
```

</div>
