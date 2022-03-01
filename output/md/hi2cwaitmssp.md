<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2cwaitmssp"></span>HI2CWaitMSSP

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HI2CWaitMSSP
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

The methods sets the global byte variable <span
class="emphasis">*HI2CWaitMSSPTimeout*</span> to 255 ( or True ) if the
MSSP module has timeout during operations.

<span class="emphasis">*HI2CWaitMSSPTimeout*</span> can tested for the
status of the I2C bus.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` screen
    HI2C2WaitMSSP
```

Supported in &lt;HI2C.H&gt;

</div>
