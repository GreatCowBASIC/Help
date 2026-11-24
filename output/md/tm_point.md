<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="tm_point"></span>TM\_Point

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    TM_Point = (Point)
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

Must be defined before use the command TMDec to set the decimal point(s)

Rules for decimal points

You can use the TM\_Point and TMWrite6dig commands to turn on one or
more decimal points.   This is achieved with an 8-bit binary number,
with the leftmost bit (MSB) representing the 1st decimal point, the next
the 2nd, and so on.   The state of the last two bits is ignored because
it is only 6 digits.  

Examples:

<div class="itemizedlist">

-   binary number 0B01010000 (decimal 80) switch on decimal point on
    digits 2 and 4.
-   number 0 switch off all digital points
-   255 (0B11111111) switch all on.

</div>

  
  
  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="7_segment_displays_tm1637_6_digits" class="link" title="7 Segment Displays - TM1637 6 Digits">7 Segment Displays - TM1637 6 Digits</a> — category
    overview and a full worked example using TMWrite6Dig
-   <a href="7_segment_displays_overview" class="link" title="7 Segment Displays Overview">7 Segment Displays Overview</a> — top-level
    category overview

</div>

</div>
