<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="i2creset"></span>I2CReset

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    I2CReset
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

This will attempt a reset of the I2C by changing the state of the I2C
bus.

<span class="strong">**Example:**</span>

``` programlisting
    'Call if the I2C bus appears to be stuck, for example a slave device holding SDA low
    I2CReset          ' <<< the I2CReset instruction
```

<span class="strong">**Key line:**</span> `I2CReset` — toggles the I2C
bus lines in an attempt to clear a stuck or hung bus condition, such as
a slave device holding SDA low.

Supported in &lt;I2C.H&gt;

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="i2c_overview" class="link" title="I2C Overview">I2C Overview</a> — category
    overview
-   <a href="i2crestart" class="link" title="I2CRestart">I2CRestart</a> — related
    command in the same category
-   <a href="i2creceive" class="link" title="I2CReceive">I2CReceive</a> — related
    command in the same category

</div>

</div>
