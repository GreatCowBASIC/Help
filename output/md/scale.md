<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="scale"></span>Scale

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    integer_variable = Scale (value_word , fromLow_integer , fromHigh_integer , toLow_integer , toHigh_integer [, calibration_integer] )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.   The parameters are:

`value`: the number to scale. A value between 0 and 0xFFFFF - all values
passed will be treated as Word variables.

`fromLow`: the lower bound of the value’s current range. An Integer
value between -32767 and 32767.

`fromHigh`: the upper bound of the value’s current range. An Integer
value between -32767 and 32767.

`toLow`: the lower bound of the value’s target range. An Integer value
between -32767 and 32767.

`toHigh`: the upper bound of the value’s target range. An Integer value
between -32767 and 32767.

`calibration`: optional calibration offset value. An Integer value
between -32767 and 32767.  
  

This is also an overloaded method. You can also use word variables to
provide a returned result of 0-65535.  

``` screen
    word_variable = Scale (value_word , fromLow_word , fromHigh_word , toLow_wordr , toHigh_word [, calibration_integer] )
```

Available on all microcontrollers.   The parameters are:

`value`: the number to scale. A value between 0 and 0xFFFFF - all values
passed will be treated as Word variables.

`fromLow`: the lower bound of the value’s current range. A word value.

`fromHigh`: the upper bound of the value’s current range. A word value.

`toLow`: the lower bound of the value’s target range. A word value.

`toHigh`: the upper bound of the value’s target range. A word value.

`calibration`: optional calibration offset value. An Integer value
between -32767 and 32767.  
  
<span class="strong">**Explanation:**</span>

Scales, re-maps, a number from one range to another.   That is, a value
of fromLow would gets scaled to toLow, a value of fromHigh to toHigh,
values in-between to values in-between, etc.

The method does not constrain values to within the integer range
returned, because out-of-range values are sometimes intended and useful.

Note that the "lower bounds" of either range may be larger or smaller
than the "upper bounds" so the scale() method may be used to reverse a
range of numbers, for example:

``` screen
    my_newvalue  = scale ( ReadAD10(An0) , 0, 1023, 135, 270)
```

The method also handles negative integer numbers well, so that this
example:

``` screen
    my_newvalue = scale(ReadAD(An0), 0, 255, 50, -100);
```

This method is similar to the Ardunio Map() function.

</div>
