<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2cstop"></span>HI2CStop

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HI2CStop
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

`HI2CStop` should be called at the end of every I2C transmission.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` screen
    HI2C2Stop
```

<span class="strong">**Example:**</span>

Please see <a href="" class="link">HI2CSend</a> and
<a href="hi2creceive" class="link" title="HI2CReceive">HI2CReceive</a>
for an example.

Supported in &lt;HI2C.H&gt;

</div>
