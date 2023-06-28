<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_i2cstart"></span>I2CStart

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    I2CStart
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

If the I2C routines are operating in Master mode, this command will send
a start condition. If routines are in Slave mode, it will pause the
program until a start condition is sent by the master. It should be
placed at the start of every I2C transmission.

If interrupt handling is enabled, this command will disable it.

<span class="strong">**Example:**</span>

Please see
<a href="_i2csend.html" class="link" title="I2CSend">I2CSend</a> and
<a href="_i2creceive.html" class="link" title="I2CReceive">I2CReceive</a>
for an example.

Supported in &lt;I2C.H&gt;

</div>
