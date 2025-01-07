<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_hyperbole"></span>Hyperbole

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    Hyperbole (x,  y,  a_axis,  b_axis,  type, ModeStop, optional LineColour=GLCDForeground)
```

<span class="strong">**Explanation:**</span>

Draws on a GLCD an hyperbole with equation (x/(a)<sup>2-(y/(b)</sup>2=1,
centered at pixel positions (x, y) with axis a and b.

The hyperbole can be aligned either along the x axis or along the y
axis.

Both cases a\_axis&gt;=b:axis and a\_axis&lt;b\_axis are accepted.

The hyperbole is an unbounded curve made by four branches

Drawing hyperbole on the screen can be stopped by following two
different criteria: - a branch has reached a border of the display - all
branches have reached the display border

For an hyperbole centered on the display these criteria are equivalent.

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
<td style="text-align: left;"><p><code class="literal">x</code></p></td>
<td style="text-align: left;"><p>X coordinates of hyperbole center (in pixel positions)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">y</code></p></td>
<td style="text-align: left;"><p>Y coordinates of hyperbole center (in pixel positions)</p>
<p>The x or y coordinates are Word value.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">a_axis</code></p></td>
<td style="text-align: left;"><p>The a axis of the hyperbole</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">b_axis</code></p></td>
<td style="text-align: left;"><p>The b axis of the hyperbole</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">type</code></p></td>
<td style="text-align: left;"><p>type=1 the hyperbole is aligned along x axis<br />
type=2 the hyperbole is aligned along y axis</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">modestop</code></p></td>
<td style="text-align: left;"><p>modestop=1 drawing stops when a display border is encountered by a hyperbole branch.<br />
modestop=2 drawing stops when all the reachable display borders are encountered by all the hyperbole branches</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LineColour</code></p></td>
<td style="text-align: left;"><p>Color of the hyperbole</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Example:**</span>

``` screen
    'Example for a 240x320 pixels GLCD

    #include <glcd.h>

    Hyperbole(120, 160, 40,20, 1, 2, GLCDForeground)   ; centered, a=40, b=20, x_axis alined, stops when all branches have reached a a border
    Hyperbole(120, 160, 40,20, 1, 1, GLCDForeground)   ; centered, a=40, b=20, x_axis alined, stops when a border is reached
    Hyperbole(120, 160, 40,20, 2, 1, GLCDForeground)   ; centered, a=40, b=20, y_axis alined, stops when a border is reached,

    Hyperbole(180, 80, 40,20, 1, 1, GLCDForeground)   ; upper right, a=40, b=20, x_axis alined, stops when a border is reached,
    Hyperbole(60, 240, 40,20, 1, 2, GLCDForeground)   ; lower left, a=40, b=20, x_axis alined, stops when all branches have reached a border

    Hyperbole(180, 80, 40,20, 2, 1, GLCDForeground)   ; upper right, a=40, b=20, y_axis alined, stops when a border is reached,
    Hyperbole(60, 240, 40,20, 2, 2, GLCDForeground)   ; lower left, a=40, b=20, y_axis alined, stops when all branches have reached a border
```

</div>
