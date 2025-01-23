<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="trigonometry_atan"></span>Trigonometry ATAN

</div>

</div>

</div>

<span class="strong">**Syntax**</span>:

``` screen
    #include <maths.h>

    integer_variable = ATan (_x_vector_,_y_vector_)
```

<span class="strong">**Explanation**</span>:

GCBASIC supports the trigonometric function for ATan.  

<span class="strong">**Details:**</span>

GCBASIC supports the following functions ATan( x, y) where x and y are
the vectors. The function returns an Integer result representing the
angle measured in a whole number of degrees.

The function also returns a global byte variable NegFlag with returns
the quadrant of the angle.

``` literallayout
Quadrant 1 = 0 to 89
Quadrant 2 = 90 to 179
Quadrant 3 = 180 to 269
Quadrant 4 = 270 to 359
```

This ATan function is a fast XY vector to integer degree algorithm
developed in Jan 2011, see www.RomanBlack.com and see
<http://www.romanblack.com/integer_degree.htm>

The function converts any XY vectors including 0 to a degree value that
should be within +/- 1 degree of the accurate value without needing
large slow trig functions like ArcTan() or ArcCos().

At least one of the X or Y values must be non-zero.   This is the full
version, for all 4 quadrants and will generate the angle in integer
degrees from 0-360.   Any values of X and Y are usable including
negative values provided they are between -1456 and 1456 so the 16bit
multiply does not overflow.

</div>
