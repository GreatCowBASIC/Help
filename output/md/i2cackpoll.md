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

``` screen
    ...
    ' ACK polling removes the need to for the 24xxxxx device to have a 5ms write time
    I2CACKPOLL( eeprom_device )
    ' You check the exit state, use I2CAckPollState to check the state of
    ' the acknowledge from the target device
     ...
```

Supported in &lt;I2C.H&gt;

</div>
