<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2csetaddress"></span>HI2CSetAddress

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
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

``` programlisting
    HI2C2SetAddress address_number
```

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F1937, 32

    HI2CMode Slave
    HI2CSetAddress 0x60          ' <<< the HI2CSetAddress instruction

    Do
        'Wait for the master to address this device at 0x60
    Loop
```

<span class="strong">**Key line:**</span> `HI2CSetAddress 0x60` — sets
this device’s own I2C address to 0x60, so it only responds when a master
addresses that specific value.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="hi2c_overview" class="link" title="HI2C Overview">HI2C Overview</a> — category
    overview
-   <a href="hi2cmode" class="link" title="HI2CMode">HI2CMode</a> — selecting
    slave mode before setting an address
-   <a href="hi2creceive" class="link" title="HI2CReceive">HI2CReceive</a> — receiving
    data addressed to this device

</div>

Supported in &lt;HI2C.H&gt;

</div>
