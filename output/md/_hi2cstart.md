<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_hi2cstart"></span>HI2CStart

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HI2CStart
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

If the HI2C routines are operating in Master mode, this command will
send a start condition. If routines are in Slave mode, it will pause the
program until a start condition is sent by the master. It should be
placed at the start of every I2C transmission.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` screen
    HI2C2Start
```

<span class="strong">**Example:**</span>

Please see
<a href="_hi2csend.html" class="link" title="HI2CSend">HI2CSend</a> and
<a href="_hi2creceive.html" class="link" title="HI2CReceive">HI2CReceive</a>
for examples.

Supported in &lt;HI2C.H&gt;

</div>
