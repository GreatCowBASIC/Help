<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="ps2readbyte"></span>PS2ReadByte

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    output = PS2ReadByte
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers.

<span class="strong">**Explanation:**</span>

`PS2ReadByte` will read a byte from the PS/2 bus. It will return the
byte, or 0 if no data was returned by the PS/2 device.

The PS/2 bus will normally be held in the inhibit state. `PS2ReadByte`
will uninhibit the bus for 25 ms. If a response is received, it will be
read. Then, the bus will be placed back in the inhibit state.

<span class="strong">**Example:**</span>

For an example, please refer to the `InKey` function.
<a href="inkey" class="link" title="InKey">PS2 Inkey</a>

</div>
