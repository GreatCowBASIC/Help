<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2cwaitmssp"></span>HI2CWaitMSSP

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
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

``` programlisting
    HI2C2WaitMSSP
```

<span class="strong">**Example:**</span>

``` programlisting
    HI2CStart
    HI2CWaitMSSP          ' <<< the HI2CWaitMSSP instruction

    if HI2CWaitMSSPTimeout <> True then
        HI2CSend ( deviceID )
    else
        HSerPrint "Bus timeout!"
    end if
```

<span class="strong">**Key line:**</span> `HI2CWaitMSSP` — waits for the
hardware MSSP module to become ready and sets `HI2CWaitMSSPTimeout` to
true if it timed out instead, so the following code can check the bus
status before sending.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hi2c_overview" class="link" title="HI2C Overview">HI2C Overview</a> — category
    overview
-   <a href="hi2cackpollstate" class="link" title="HI2CAckPollState">HI2CAckPollState</a> — related
    command in the same category
-   <a href="hi2creceive" class="link" title="HI2CReceive">HI2CReceive</a> — related
    command in the same category

</div>

Supported in &lt;HI2C.H&gt;

</div>
