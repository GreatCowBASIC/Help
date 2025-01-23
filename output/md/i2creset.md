<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="i2creset"></span>I2CReset

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    I2CReset
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

This will attempt a reset of the I2C by changing the state of the I2C
bus.

<span class="strong">**Example:**</span>

``` screen
 ...
    I2CReset
 ...
```

Supported in &lt;I2C.H&gt;

</div>
