<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_i2cackpollstate"></span>I2CAckPollState

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
 <test condition> I2CAckPollState
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers except 12 bit instruction Microchip
PIC microcontrollers (10F, 12F5xx, 16F5xx chips)

<span class="strong">**Explanation:**</span>

Should only be used when I2C routines are operating in Master mode, this
command will return the last state of the acknowledge response from a
specific I2C device on the I2C bus.

`I2CACKPOLL` sets the state of variable `I2CAckPollState`.
`I2CAckPollState` can only read - it cannot be set.

<span class="strong">**Example:**</span>

``` screen
    ...
    ' ACK polling removes the need to for the 24xxxxx device to have a 5ms
    write time
    I2CACKPOLL( eeprom_device )
    ' You check the exit state,
    ' Use I2CAckPollState to check the state of a target device
     ...
```

Supported in &lt;I2C.H&gt;

</div>
