<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="i2cackpoll"></span>I2CAckpoll

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
   I2CAckpoll ( I2C_device_address )
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

Should only be used when I2C routines are operating in Master mode, this
command will look for a specific I2C device on the I2C bus.

This sets a global variable `I2CAckPollState` that can be inspected in
your calling routine.

<span class="strong">**Example:**</span>

``` programlisting
    ...
    ' ACK polling removes the need to for the 24xxxxx device to have a 5ms write time
    I2CACKPOLL( eeprom_device )          ' <<< the I2CAckpoll instruction
    ' You check the exit state, use I2CAckPollState to check the state of
    ' the acknowledge from the target device
     ...
```

<span class="strong">**Key line:**</span>
`I2CACKPOLL( eeprom_device )` — repeatedly addresses `eeprom_device` on
the bus, letting the caller poll `I2CAckPollState` until the device
acknowledges, instead of waiting a fixed delay for its write cycle to
finish.

Supported in &lt;I2C.H&gt;

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="i2c_overview" class="link" title="I2C Overview">I2C Overview</a> — category
    overview
-   <a href="i2cackpollstate" class="link" title="I2CAckPollState">I2CAckPollState</a> — related
    command in the same category
-   <a href="i2creceive" class="link" title="I2CReceive">I2CReceive</a> — related
    command in the same category

</div>

</div>
