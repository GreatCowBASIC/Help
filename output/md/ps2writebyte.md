<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ps2writebyte"></span>PS2WriteByte

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PS2WriteByte user_data
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`PS2WriteByte` will send a byte to a PS/2 device. Once the byte has been
written, the PS/2 bus will be placed in the inhibit state.

<span class="strong">**Example:**</span>

For an example, please refer to the `PS2SetKBLeds` function.  
<a href="ps2setkbleds" class="link" title="PS2SetKBLeds">PS2 Set Keyboard Leds</a>

</div>
