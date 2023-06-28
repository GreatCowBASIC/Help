<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_i2cstop"></span>I2CStop

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    I2CStop
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction
microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

When in Master mode, this command will send an I2C stop condition, and
re-enable interrupts if `I2CStart` disabled them. In Slave mode, it will
re- enable interrupts.

`I2CStop` should be called at the end of every I2C transmission.

<span class="strong">**Example:**</span>

Please see
<a href="_i2csend.html" class="link" title="I2CSend">I2CSend</a> and
<a href="_i2creceive.html" class="link" title="I2CReceive">I2CReceive</a>
for an example.

Supported in &lt;I2C.H&gt;

</div>
