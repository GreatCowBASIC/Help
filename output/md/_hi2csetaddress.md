<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_hi2csetaddress"></span>HI2CSetAddress

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HI2CSetAddress address_number
```

<span class="strong">**Command Availability:**</span>

Only available for microcontrollers with the hardware I2C or TWI module.

<span class="strong">**Explanation:**</span>

Sets the microcontroller address number in Slave mode.

Only used in slave mode.

<span class="strong">**Note:**</span>

This command is also available on microcontrollers with a second
hardware I2C port.

``` screen
    HI2C2SetAddress address_number
```

Supported in &lt;HI2C.H&gt;

</div>
