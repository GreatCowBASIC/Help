<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_hi2cmode"></span>HI2CMode

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HI2CMode Master | Slave
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

Sets the microcontroller to either a Master device or a Slave device.

Only used in slave mode

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` screen
    HI2C2Mode Master | Slave
```

Supported in &lt;HI2C.H&gt;

</div>
