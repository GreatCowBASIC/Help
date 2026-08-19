<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2cstartoccurred"></span>HI2CStartOccurred

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HI2CStartOccurred
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

Check if a start condition has occurred since the last run of this
function

Only used in slave mode.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` screen
    HI2C2StartOccurred
```

Supported in &lt;HI2C.H&gt;

</div>
